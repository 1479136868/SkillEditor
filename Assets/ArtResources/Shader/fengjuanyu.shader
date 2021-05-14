// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32515,y:32637|emission-52-OUT,alpha-17-A;n:type:ShaderForge.SFN_Tex2d,id:2,x:33940,y:32653,ptlb:node_2,ptin:_node_2,tex:58d0bde50351df247871c2e6f71d0ba8,ntxv:0,isnm:False|UVIN-7-UVOUT;n:type:ShaderForge.SFN_Panner,id:7,x:34134,y:32641,spu:0.3,spv:-1;n:type:ShaderForge.SFN_Tex2d,id:16,x:33459,y:32820,ptlb:node_16,ptin:_node_16,tex:118e99ed79c8d2c4d913c006127ff05a,ntxv:0,isnm:False;n:type:ShaderForge.SFN_VertexColor,id:17,x:33038,y:32855;n:type:ShaderForge.SFN_Multiply,id:18,x:33282,y:32658|A-81-OUT,B-16-RGB;n:type:ShaderForge.SFN_Vector3,id:51,x:33267,y:32855,v1:0.4117647,v2:0.6835697,v3:1;n:type:ShaderForge.SFN_Multiply,id:52,x:32960,y:32686|A-18-OUT,B-51-OUT,C-17-RGB;n:type:ShaderForge.SFN_Tex2d,id:78,x:33975,y:32865,ptlb:node_2_copy,ptin:_node_2_copy,tex:58d0bde50351df247871c2e6f71d0ba8,ntxv:0,isnm:False|UVIN-80-UVOUT;n:type:ShaderForge.SFN_Panner,id:80,x:34169,y:32853,spu:-0.2,spv:-0.5;n:type:ShaderForge.SFN_Add,id:81,x:33558,y:32663|A-2-RGB,B-78-RGB;proporder:2-16-78;pass:END;sub:END;*/

Shader "Shader Forge/fengjuanyu" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_16 ("node_16", 2D) = "white" {}
        _node_2_copy ("node_2_copy", 2D) = "white" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _node_2; uniform float4 _node_2_ST;
            uniform sampler2D _node_16; uniform float4 _node_16_ST;
            uniform sampler2D _node_2_copy; uniform float4 _node_2_copy_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float4 node_100 = _Time + _TimeEditor;
                float2 node_99 = i.uv0;
                float2 node_7 = (node_99.rg+node_100.g*float2(0.3,-1));
                float2 node_80 = (node_99.rg+node_100.g*float2(-0.2,-0.5));
                float4 node_17 = i.vertexColor;
                float3 emissive = (((tex2D(_node_2,TRANSFORM_TEX(node_7, _node_2)).rgb+tex2D(_node_2_copy,TRANSFORM_TEX(node_80, _node_2_copy)).rgb)*tex2D(_node_16,TRANSFORM_TEX(node_99.rg, _node_16)).rgb)*float3(0.4117647,0.6835697,1)*node_17.rgb);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,node_17.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
