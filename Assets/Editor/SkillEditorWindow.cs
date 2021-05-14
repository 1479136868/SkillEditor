using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System;

public class SkillEditorWindow : EditorWindow
{
    Player player;
    List<ComponentBase> skills;
    float currentSpeed = 1;
    public void SetInitSkill(List<ComponentBase> _skills, Player player)
    {
        this.player = player;
        currentSpeed = 1;
        skills = _skills;
    }

    string[] skillComponent = new string[] { "Null", "动画", "声音", "特效" };

    int skillComponentIndex = 0;
    private Vector2 ScrollViewPos = new Vector2(0, 0);

    private void OnGUI()
    {
        GUILayout.BeginHorizontal();

        if (GUILayout.Button("播放"))
        {
            foreach (var item in skills)
            {
                item.Play();
            }
        }
        if (GUILayout.Button("停止"))
        {
            foreach (var item in skills)
            {
                item.Stop();
            }
        }
        GUILayout.EndHorizontal();
        GUILayout.Label("速度：");
        float speed = EditorGUILayout.Slider(currentSpeed, 0, 5);
        if (speed != currentSpeed)
        {
            currentSpeed = speed;
            Time.timeScale = currentSpeed;
        }
        GUILayout.BeginHorizontal();

        skillComponentIndex = EditorGUILayout.Popup(skillComponentIndex, skillComponent);
        if (GUILayout.Button("添加"))
        {
            switch (skillComponentIndex)
            {
                case 1:
                    skills.Add(new AnimComponent(player));
                    break;
                case 2:
                    skills.Add(new AudioComponent(player));
                    break;
                case 3:
                    skills.Add(new EffectsComponent(player));
                    break;
                default:
                    break;
            }
        }
        GUILayout.EndHorizontal();
        ScrollViewPos = GUILayout.BeginScrollView(ScrollViewPos, false, true);
        foreach (var item in skills)
        {
            GUILayout.BeginHorizontal();
            GUILayout.Label(item.name);
            if (GUILayout.Button("删除"))
            {
                skills.Remove(item);
            }
            GUILayout.EndHorizontal();
            if (item is AnimComponent)
            {
                ShowAnimComponent(item as AnimComponent);
            }
            else if (item is AudioComponent)
            {
                ShowAudioComponent(item as AudioComponent);
            }
            else if (item is EffectsComponent)
            {
                ShowEffectComponent(item as EffectsComponent);
            }
        }
        GUILayout.EndScrollView();
    }

    private void ShowEffectComponent(EffectsComponent effectsComponent)
    {
        GameObject gameClip = EditorGUILayout.ObjectField(effectsComponent.gameClip, typeof(GameObject), false) as GameObject;
        if (effectsComponent.gameClip != gameClip)
        {
            effectsComponent.SetGameClip(gameClip);
        }
    }

    private void ShowAudioComponent(AudioComponent audioComponent)
    {
        AudioClip gameClip = EditorGUILayout.ObjectField(audioComponent.audioClip, typeof(AudioClip), false) as AudioClip;
        if (audioComponent.audioClip != gameClip)
        {
            audioComponent.SetAudioClip(gameClip);
        }
    }

    private void ShowAnimComponent(AnimComponent animComponent)
    {
        AnimationClip gameClip = EditorGUILayout.ObjectField(animComponent.animClip, typeof(AnimationClip), false) as AnimationClip;
        if (animComponent.animClip != gameClip)
        {
            animComponent.SetAnimClip(gameClip);
        }
    }
     
}
