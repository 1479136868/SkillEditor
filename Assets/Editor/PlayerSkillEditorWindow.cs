using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class PlayerSkillEditorWindow : EditorWindow
{

    class PlayerEditor
    {
        public int characterIndex = 0;
        public int foldIndex = 0;
        public string characterName = string.Empty;
        public string folderName = string.Empty;
        public string characterFilter = string.Empty;
        public List<string> characteList = new List<string>();
        public Player player = null;

    }

    PlayerEditor m_player = new PlayerEditor();
    List<string> m_folderList = new List<string>();
    List<string> m__characterList = new List<string>();
    Dictionary<string, List<string>> m_folderPrefabs = new Dictionary<string, List<string>>();

    string newSkillName = string.Empty;
    SkillEditorWindow skillEditorWindow;

    private void OnEnable()
    {
        DoSearchFolder();
        DoSearchCharacter();
    }

    private void DoSearchCharacter()
    {
        m__characterList.Clear();
        string[] files = Directory.GetFiles(GetCharacterPath(), "*.prefab", SearchOption.AllDirectories);
        foreach (var item in files)
        {
            m__characterList.Add(Path.GetFileNameWithoutExtension(item));
            m__characterList.Sort();
            m__characterList.Insert(0, "Null");
            m_player.characteList.AddRange(m__characterList);
        }
    }

    private void DoSearchFolder()
    {
        m_folderList.Clear();
        m_folderList.Add("All");
        string[] foladers = Directory.GetDirectories(GetCharacterPath());
        foreach (var item in foladers)
        {
            m_folderList.Add(Path.GetFileName(item));
        }
    }

    Vector2 scrollViewPos = new Vector2(0, 0);

    [MenuItem("Tools/技能编辑器")]
    private static void Start()
    {
        if (Application.isPlaying)
        {
            PlayerSkillEditorWindow window = EditorWindow.GetWindow<PlayerSkillEditorWindow>();
            if (window)
            {
                window.Show();
            }

        }
    }
    private void OnGUI()
    {
        int folderIndex = EditorGUILayout.Popup(m_player.foldIndex, m_folderList.ToArray());
        if (folderIndex != m_player.foldIndex)
        {
            m_player.foldIndex = folderIndex;
            m_player.characterIndex = -1;
            string folderName = m_folderList[m_player.foldIndex];
            List<string> list;
            if (folderName.Equals("All"))
            {
                list = m__characterList;
            }
            else
            {
                if (!m_folderPrefabs.TryGetValue(folderName, out list))
                {
                    list = new List<string>();
                    string[] files = Directory.GetFiles(GetCharacterPath() + "/" + folderName, "*.prefab", SearchOption.AllDirectories);
                    foreach (var item in files)
                    {
                        list.Add(Path.GetFileNameWithoutExtension(item));
                    }
                    m_folderPrefabs[folderName] = list;
                }
            }
            m_player.characteList.Clear();
            m_player.characteList.AddRange(list);
        }
        int characterIndex = EditorGUILayout.Popup(m_player.characterIndex, m_player.characteList.ToArray());
        if (characterIndex != m_player.characterIndex)
        {
            m_player.characterIndex = characterIndex;
            if (m_player.characterName != m_player.characteList[m_player.characterIndex])
            {
                m_player.characterName = m_player.characteList[m_player.characterIndex];
                if (!string.IsNullOrEmpty(m_player.characterName))
                {
                    if (m_player.player != null)
                    {
                        m_player.player.Destroy();
                    }
                    m_player.player = Player.Init(m_player.characterName);
                }
            }
        }
        newSkillName = GUILayout.TextField(newSkillName);
        if (GUILayout.Button("创建新技能!"))
        {
            if (!string.IsNullOrEmpty(newSkillName) && m_player.player != null)
            {
                List<ComponentBase> skillsBase = m_player.player.AddNewSkill(newSkillName);
                OpenSkillEditorWindow(newSkillName, skillsBase);
                newSkillName = "";
            }
        }
        if (m_player.player != null)
        {
            scrollViewPos = GUILayout.BeginScrollView(scrollViewPos, false, true);
            foreach (var item in m_player.player.skillsList)
            {
                GUILayout.BeginHorizontal();
                if (GUILayout.Button(item.Key))
                {
                    List<ComponentBase> skills = m_player.player.GetSkill(item.Key);
                    foreach (var ite in skills)
                    {
                        ite.Init();
                    }
                    OpenSkillEditorWindow(item.Key, skills);
                }
                GUILayoutOption[] options = new GUILayoutOption[] {
                    GUILayout.Width(60),GUILayout.Height(19)
                };
                if (GUILayout.Button("删除技能", options))
                {
                    m_player.player.RemoveSkill(item.Key);
                    break;
                }
                GUILayout.EndHorizontal();
            }
            GUILayout.EndScrollView();
        }
    }

    private void OpenSkillEditorWindow(string newSkillName, List<ComponentBase> skillsBase)
    {
        if (skillsBase != null)
        {
            if (skillEditorWindow == null)
            {
                skillEditorWindow = EditorWindow.GetWindow<SkillEditorWindow>();
            }
            skillEditorWindow.titleContent = new GUIContent(newSkillName);
            //初始化 技能详情窗口
            skillEditorWindow.SetInitSkill(skillsBase, m_player.player);
            //显示编辑器窗口的窗口。
            skillEditorWindow.Show();
            //使窗口重画。
            skillEditorWindow.Repaint();
        }
    }

    private string GetCharacterPath()
    {
        return Application.dataPath + "/GameDate/Model";
    }
}
