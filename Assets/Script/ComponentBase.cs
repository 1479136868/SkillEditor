using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class ComponentBase 
{
    public Player player;
    //技能效果名称
    public string name = string.Empty;

    public ComponentBase(Player _player) { player = _player; }

    public virtual void Play()
    {

    }
    public virtual void Init()
    {

    }
    public virtual void Stop()
    {

    }

}
