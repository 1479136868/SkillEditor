using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AnimComponent : ComponentBase
{

    Animator anim;
    public AnimationClip animClip;
    public AnimatorOverrideController controller;

    public AnimComponent(Player player) : base(player)
    {
        anim = player.gameObject.GetComponent<Animator>();
        controller = player.overrideController;

        Debug.LogError(controller);

    }

    public override void Init()
    {
        base.Init();
        controller["Start"] = animClip;
    }

    public override void Play()
    {
        base.Play();
        anim.StopPlayback();
        AnimatorStateInfo stateInfo = anim.GetCurrentAnimatorStateInfo(0);
        if (stateInfo.IsName("Idle"))
        {
            anim.SetTrigger("Play");
        }
    }

    public override void Stop()
    {
        base.Stop();
        anim.StartPlayback();
    }

    public void SetAnimClip(AnimationClip clip)
    {
        animClip = clip;
        name = animClip.name;
        controller["Start"] = animClip;
    }
}
