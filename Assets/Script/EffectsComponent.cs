using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EffectsComponent : ComponentBase
{
    public GameObject gameClip;

    ParticleSystem particleSystem;

    GameObject obj;

    public EffectsComponent(Player player) : base(player) { }

    public override void Init()
    {
        base.Init(); 
        if (gameClip.GetComponent<ParticleSystem>() != null)
        {
            particleSystem = obj.GetComponent<ParticleSystem>();
            particleSystem.Stop();
        }
    }

    public override void Play()
    {
        base.Play();
        if (particleSystem != null)
        {
            particleSystem.Play();
        }
    }

    public override void Stop()
    {
        base.Stop();
        if (particleSystem!=null)
        {
            particleSystem.Stop();
        }
    }

    public void SetGameClip(GameObject clip)
    {
        gameClip = clip;
        if (gameClip.GetComponent<ParticleSystem>())
        {
            obj = GameObject.Instantiate(gameClip,player.effectsparent);
            particleSystem = obj.GetComponent<ParticleSystem>();
            particleSystem.Stop();
        }
        name = gameClip.name;
    }
     
}
