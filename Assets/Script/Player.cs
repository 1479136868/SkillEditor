using System;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;
using Newtonsoft.Json;

public class Player : MonoBehaviour
{
    public Dictionary<string, List<ComponentBase>> skillsList = new Dictionary<string, List<ComponentBase>>();


    public AnimatorOverrideController overrideController;
    public RuntimeAnimatorController controller;
    public Animator animator;
    public AudioSource audioSource;
    public Transform effectsparent; 

    public static Player Init(string characterName)
    {
        if (characterName != null)
        {
            string path = "Assets/Prefab/" + characterName + ".prefab";
            GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(path);
            if (obj)
            {
                //根据路径，实例化一个游戏物体，并且添加Player脚本
                Player player = GameObject.Instantiate(obj).AddComponent<Player>();

                player.animator = player.gameObject.GetComponent<Animator>();
          
                player.overrideController = new AnimatorOverrideController();
                //动态加载动画状态机
                player.controller = Resources.Load<RuntimeAnimatorController>("Player");

               
                player.overrideController.runtimeAnimatorController = player.controller;

               
                player.animator.runtimeAnimatorController = player.overrideController;
                //添加声音组件
                player.audioSource = player.gameObject.AddComponent<AudioSource>();
                //找特效挂载点
                player.effectsparent = player.transform.Find("effectsparent");
                //给游戏物体改名字
                player.gameObject.name = characterName;

                player.LoadAllSkill();

                

                return player;
            }
        }
        print("空");
        return null;
    }

    private void LoadAllSkill()
    {
        string path = "Assets/" + gameObject.name + ".txt";

        if (File.Exists(path))
        {
            string str = File.ReadAllText(path);

            List<SkillJson> skills = JsonConvert.DeserializeObject<List<SkillJson>>(str);
            //遍历解析出来的Json列表
            foreach (var item in skills)
            {
                //根据item的技能名字来加上技能列表
                skillsList.Add(item.name, new List<ComponentBase>());
                //遍历对应名字的技能列表
                foreach (var ite in item.skills)
                {
                    //遍历每个技能的属性
                    foreach (var it in ite.Value)
                    {
                        if (ite.Key.Equals("动画"))
                        {
                            AnimationClip clip = AssetDatabase.LoadAssetAtPath<AnimationClip>("Assets/GameDate/Anim/" + it + ".anim");
                            print("++++++++"+ "Assets/GameDate/Anim/" + it + ".anim");
                            AnimComponent _anim = new AnimComponent(this);
                            _anim.SetAnimClip(clip);
                            print(clip);
                            skillsList[item.name].Add(_anim);
                        }
                        else if (ite.Key.Equals("音效"))
                        {
                            AudioClip clip = AssetDatabase.LoadAssetAtPath<AudioClip>("Assets/GameDate/Audio/" + it + ".mp3");

                            AudioComponent _audio = new AudioComponent(this);

                            _audio.SetAudioClip(clip);
                            skillsList[item.name].Add(_audio);
                        }
                        else if (ite.Key.Equals("特效"))
                        {
                            GameObject clip = AssetDatabase.LoadAssetAtPath<GameObject>("Assets/GameDate/Effect/Skill/" + it + ".prefab");
                            EffectsComponent _effect = new EffectsComponent(this);
                            _effect.SetGameClip(clip);
                            skillsList[item.name].Add(_effect);
                        }
                    }

                }
            }
        }
    }

    public void Destroy()
    {
        Debug.LogWarning("Destroy");
        Destroy(gameObject);
    }
    private void OnDestroy()
    {
        List<SkillJson> skills = new List<SkillJson>();
        foreach (var item in skillsList)
        {
            SkillJson json = new SkillJson();
            json.name = item.Key;
            foreach (var ite in item.Value)
            {
                if (ite is AnimComponent)
                {
                    if (!json.skills.ContainsKey("动画"))
                    {
                        json.skills.Add("动画",new List<string>());
                    }
                    json.skills["动画"].Add(ite.name);
                }
                if (ite is AudioComponent)
                {
                    if (!json.skills.ContainsKey("音效"))
                    {
                        json.skills.Add("音效", new List<string>());
                    }
                    json.skills["音效"].Add(ite.name);
                }
                if (ite is EffectsComponent)
                {
                    if (!json.skills.ContainsKey("特效"))
                    {
                        json.skills.Add("特效", new List<string>());
                    }
                    json.skills["特效"].Add(ite.name);
                }
            }
            skills.Add(json);
        }
        string str = JsonConvert.SerializeObject(skills);
        File.WriteAllText("Assets/" + gameObject.name + ".txt", str);
        AssetDatabase.Refresh();
    }

    public List<ComponentBase> GetSkill(string key)
    {
        if (skillsList.ContainsKey(key))
        {
            return skillsList[key];
        }
        return null;
    }

    public void RemoveSkill(string key)
    {
        if (skillsList.ContainsKey(key))
        {
            skillsList.Remove(key);
        }
    }

    public List<ComponentBase> AddNewSkill(string newSkillName)
    {
        if (skillsList.ContainsKey(newSkillName))
        {
            return skillsList[newSkillName];
        }
        skillsList.Add(newSkillName,new List<ComponentBase>());
        return skillsList[newSkillName];
    }
}

public class SkillJson
{
    public string name;
    public Dictionary<string, List<string>> skills = new Dictionary<string, List<string>>();
}