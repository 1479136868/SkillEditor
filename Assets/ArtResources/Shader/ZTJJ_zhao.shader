// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:2,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.9411765,fgcg:0.8665314,fgcb:0.6228374,fgca:1,fgde:1,fgrn:-14,fgrf:245.6,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32527,y:32629|emission-28-OUT,alpha-22-A;n:type:ShaderForge.SFN_Tex2d,id:2,x:33604,y:32686,ptlb:node_2,ptin:_node_2,tex:43dd300b03fbd4e4a98a2ae9cbdce839,ntxv:0,isnm:False|UVIN-18-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:17,x:33406,y:32860,ptlb:node_17,ptin:_node_17,tex:74a855a9dcaef6e4689a5a41abb34307,ntxv:0,isnm:False|UVIN-192-UVOUT;n:type:ShaderForge.SFN_Panner,id:18,x:33790,y:32686,spu:0,spv:0.12;n:type:ShaderForge.SFN_TexCoord,id:19,x:34097,y:33005,uv:0;n:type:ShaderForge.SFN_Vector2,id:21,x:34006,y:32901,v1:0,v2:0.5;n:type:ShaderForge.SFN_VertexColor,id:22,x:33041,y:32897;n:type:ShaderForge.SFN_Multiply,id:28,x:32847,y:32696|A-56-OUT,B-22-A;n:type:ShaderForge.SFN_Multiply,id:56,x:33091,y:32648|A-196-OUT,B-17-RGB,C-520-OUT;n:type:ShaderForge.SFN_Panner,id:192,x:33625,y:32925,spu:0,spv:0.5|UVIN-195-OUT,DIST-194-OUT;n:type:ShaderForge.SFN_Vector1,id:194,x:33806,y:33069,v1:2;n:type:ShaderForge.SFN_Multiply,id:195,x:33821,y:32935|A-21-OUT,B-19-UVOUT;n:type:ShaderForge.SFN_Multiply,id:196,x:33330,y:32675|A-478-OUT,B-2-RGB,C-2-RGB;n:type:ShaderForge.SFN_Fresnel,id:478,x:33470,y:32567|EXP-487-OUT;n:type:ShaderForge.SFN_Vector1,id:487,x:33644,y:32530,v1:1.2;n:type:ShaderForge.SFN_Vector1,id:520,x:33201,y:32836,v1:1.5;proporder:2-17;pass:END;sub:END;*/

Shader "Shader Forge/shuiqiu_zhushui" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_17 ("node_17", 2D) = "white" {}
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
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float4 vertexColor : COLOR;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = mul(float4(v.normal,0), unity_WorldToObject).xyz;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float3 normalDirection =  i.normalDir;
                
                float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
                i.normalDir *= nSign;
                normalDirection *= nSign;
                
////// Lighting:
////// Emissive:
                float4 node_536 = _Time + _TimeEditor;
                float2 node_18 = (i.uv0.rg+node_536.g*float2(0,0.12));
                float4 node_2 = tex2D(_node_2,TRANSFORM_TEX(node_18, _node_2));
                float2 node_192 = ((float2(0,0.5)*i.uv0.rg)+2.0*float2(0,0.5));
                float4 node_22 = i.vertexColor;
                float3 emissive = (((pow(1.0-max(0,dot(normalDirection, viewDirection)),1.2)*node_2.rgb*node_2.rgb)*tex2D(_node_17,TRANSFORM_TEX(node_192, _node_17)).rgb*1.5)*node_22.a);
                float3 finalColor = emissive;
/// Final Color:
                return fixed4(finalColor,node_22.a);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
