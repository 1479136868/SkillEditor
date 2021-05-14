using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AudioComponent :ComponentBase
{
    AudioClip clip;
   public AudioSource audioSource;

    public AudioComponent(Player player) : base(player) {
        audioSource = player.gameObject.GetComponent<AudioSource>();
    }

    public AudioClip audioClip;

    public override void Init()
    {
        base.Init();
        audioSource.clip = audioClip;
    }

    public override void Play()
    {
        base.Play();
        audioSource.Play();
    }

    public override void Stop()
    {
        base.Stop();
        audioSource.Stop();
    }

    public void SetAudioClip(AudioClip _audioClip)
    {
        audioClip = _audioClip;
        name = audioClip.name;
        audioSource.clip = _audioClip;
    }
}
