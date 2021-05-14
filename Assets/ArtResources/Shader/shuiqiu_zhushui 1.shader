// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:2,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9411765,fgcg:0.8665314,fgcb:0.6228374,fgca:1,fgde:1,fgrn:-14,fgrf:245.6,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32527,y:32629|emission-28-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:33604,y:32686,ptlb:node_2,ptin:_node_2,tex:4cefa89ad08ebe146bf3f1269ef9779b,ntxv:0,isnm:False|UVIN-18-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:17,x:33456,y:32877,ptlb:node_17,ptin:_node_17,tex:9ab3ec669ac5d3f439f0f16dc7ddf250,ntxv:0,isnm:False|UVIN-192-UVOUT;n:type:ShaderForge.SFN_Panner,id:18,x:33774,y:32686,spu:0,spv:-0.12;n:type:ShaderForge.SFN_TexCoord,id:19,x:34097,y:33005,uv:0;n:type:ShaderForge.SFN_Vector2,id:21,x:34006,y:32901,v1:0,v2:0.5;n:type:ShaderForge.SFN_VertexColor,id:22,x:33025,y:32805;n:type:ShaderForge.SFN_Multiply,id:28,x:32847,y:32696|A-56-OUT,B-22-A;n:type:ShaderForge.SFN_Multiply,id:56,x:33045,y:32592|A-356-OUT,B-196-OUT;n:type:ShaderForge.SFN_Panner,id:192,x:33625,y:32925,spu:0,spv:-0.6|UVIN-195-OUT,DIST-194-OUT;n:type:ShaderForge.SFN_Vector1,id:194,x:33878,y:33068,v1:0.07;n:type:ShaderForge.SFN_Multiply,id:195,x:33821,y:32935|A-21-OUT,B-19-UVOUT;n:type:ShaderForge.SFN_Multiply,id:196,x:33321,y:32673|A-2-RGB,B-17-RGB;n:type:ShaderForge.SFN_Vector3,id:356,x:33389,y:32545,v1:0,v2:0.1,v3:3;proporder:2-17;pass:END;sub:END;*/

Shader "Shader Forge/shuiqiu_zhushui" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_17 ("node_17", 2D) = "white" {}
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
            Blend SrcAlpha One
            Cull Off
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
            uniform sampler2D _node_17; uniform float4 _node_17_ST;
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
                float4 node_574 = _Time + _TimeEditor;
                float2 node_18 = (i.uv0.rg+node_574.g*float2(0,-0.12));
                float2 node_192 = ((float2(0,0.5)*i.uv0.rg)+0.07*float2(0,-0.6));
                float3 emissive = ((float3(0,0.1,3)*(tex2D(_node_2,TRANSFORM_TEX(node_18, _node_2)).rgb*tex2D(_node_17,TRANSFORM_TEX(node_192, _node_17)).rgb))*i.vertexColor.a);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
