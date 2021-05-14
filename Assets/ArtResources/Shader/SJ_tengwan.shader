// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:1,cusa:False,bamd:0,cgin:,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32457,y:32459,varname:node_3138,prsc:2|emission-3998-OUT,clip-9191-A;n:type:ShaderForge.SFN_Color,id:7241,x:30928,y:32554,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.1011029,c2:0.8088235,c3:0.2246548,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9647,x:31258,y:32895,ptovrint:False,ptlb:node_9647,ptin:_node_9647,varname:node_9647,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ced698439206a4d4380ed5168f25f9a0,ntxv:2,isnm:False;n:type:ShaderForge.SFN_Fresnel,id:3715,x:31020,y:32828,varname:node_3715,prsc:2|EXP-6169-OUT;n:type:ShaderForge.SFN_Multiply,id:6424,x:31536,y:32519,varname:node_6424,prsc:2|A-372-OUT,B-2959-OUT;n:type:ShaderForge.SFN_Vector1,id:372,x:31200,y:32401,varname:node_372,prsc:2,v1:2;n:type:ShaderForge.SFN_Vector1,id:6169,x:30761,y:32827,varname:node_6169,prsc:2,v1:3;n:type:ShaderForge.SFN_Multiply,id:2959,x:31306,y:32681,varname:node_2959,prsc:2|A-7241-RGB,B-3715-OUT;n:type:ShaderForge.SFN_Add,id:6723,x:31932,y:32494,varname:node_6723,prsc:2|A-6424-OUT,B-8955-OUT;n:type:ShaderForge.SFN_Tex2d,id:9191,x:31942,y:32737,ptovrint:False,ptlb:node_9191,ptin:_node_9191,varname:node_9191,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:14258c295186c5d4fb1671b08fcd6a09,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:3998,x:32219,y:32562,varname:node_3998,prsc:2|A-6723-OUT,B-9191-RGB;n:type:ShaderForge.SFN_Multiply,id:8955,x:31688,y:32712,varname:node_8955,prsc:2|A-9647-RGB,B-4973-OUT;n:type:ShaderForge.SFN_Vector1,id:4973,x:31419,y:33129,varname:node_4973,prsc:2,v1:0.7;proporder:7241-9191-9647;pass:END;sub:END;*/

Shader "Shader Forge/tengwan 1" {
    Properties {
        _Color ("Color", Color) = (0.1011029,0.8088235,0.2246548,1)
        _node_9191 ("node_9191", 2D) = "white" {}
        _node_9647 ("node_9647", 2D) = "black" {}
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
            "PreviewType"="Plane"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _node_9647; uniform float4 _node_9647_ST;
            uniform sampler2D _node_9191; uniform float4 _node_9191_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 _node_9191_var = tex2D(_node_9191,TRANSFORM_TEX(i.uv0, _node_9191));
                clip(_node_9191_var.a - 0.5);
////// Lighting:
////// Emissive:
                float4 _node_9647_var = tex2D(_node_9647,TRANSFORM_TEX(i.uv0, _node_9647));
                float3 emissive = (((2.0*(_Color.rgb*pow(1.0-max(0,dot(normalDirection, viewDirection)),3.0)))+(_node_9647_var.rgb*0.7))*_node_9191_var.rgb);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Back
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform sampler2D _node_9191; uniform float4 _node_9191_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 _node_9191_var = tex2D(_node_9191,TRANSFORM_TEX(i.uv0, _node_9191));
                clip(_node_9191_var.a - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
