// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:1,uamb:True,mssp:True,lmpd:False,lprd:False,enco:False,frtr:True,vitr:True,dbil:False,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:5,bsrc:3,bdst:0,culm:2,dpts:2,wrdp:False,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:30623,y:32723|emission-31-OUT;n:type:ShaderForge.SFN_Tex2d,id:2,x:32786,y:32646,ptlb:node_2,ptin:_node_2,tex:f4111f186eb330e41b174fa91b87ca5d,ntxv:0,isnm:False|UVIN-4-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:3,x:32786,y:32860,ptlb:node_3,ptin:_node_3,tex:72466a98ea44f704081938115b64cd04,ntxv:0,isnm:False|UVIN-5-UVOUT;n:type:ShaderForge.SFN_Panner,id:4,x:33022,y:32582,spu:0.06,spv:0.3;n:type:ShaderForge.SFN_Panner,id:5,x:32983,y:32867,spu:0.03,spv:-1;n:type:ShaderForge.SFN_Multiply,id:6,x:32460,y:32743|A-2-R,B-3-R;n:type:ShaderForge.SFN_Add,id:7,x:32195,y:32718|A-8-UVOUT,B-6-OUT;n:type:ShaderForge.SFN_Panner,id:8,x:32450,y:32587,spu:0,spv:-0.1;n:type:ShaderForge.SFN_Tex2d,id:9,x:31982,y:32718,ptlb:node_9,ptin:_node_9,tex:b9790dd3bc538cc499bcfbf34de9948c,ntxv:0,isnm:False|UVIN-7-OUT;n:type:ShaderForge.SFN_Vector3,id:18,x:31835,y:32877,v1:0.5514706,v2:0.410359,v3:0.1986916;n:type:ShaderForge.SFN_Multiply,id:19,x:31518,y:32737|A-9-RGB,B-18-OUT;n:type:ShaderForge.SFN_Tex2d,id:30,x:31166,y:32704,ptlb:node_30,ptin:_node_30,tex:1ee61241be714134e812fbf9c5c5d0ac,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:31,x:30906,y:32811|A-30-RGB,B-102-OUT;n:type:ShaderForge.SFN_Tex2d,id:78,x:32075,y:32916,ptlb:node_78,ptin:_node_78,tex:3bb75296d07cdb04f97328fdd07c8969,ntxv:0,isnm:False|UVIN-79-UVOUT;n:type:ShaderForge.SFN_Panner,id:79,x:32260,y:32938,spu:0,spv:-1.5;n:type:ShaderForge.SFN_Multiply,id:80,x:31624,y:32925|A-78-B,B-81-OUT,C-281-OUT;n:type:ShaderForge.SFN_Vector3,id:81,x:31866,y:33046,v1:0.875,v2:0.6408088,v3:0.2895221;n:type:ShaderForge.SFN_Add,id:102,x:31166,y:32861|A-19-OUT,B-80-OUT;n:type:ShaderForge.SFN_Tex2d,id:259,x:32835,y:33703,ptlb:node_259,ptin:_node_259,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:260,x:32865,y:33905,ptlb:node_260,ptin:_node_260,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:262,x:32563,y:33750|A-259-RGB,B-260-RGB;n:type:ShaderForge.SFN_Multiply,id:263,x:32270,y:33718|A-262-OUT,B-264-OUT;n:type:ShaderForge.SFN_Vector1,id:264,x:32563,y:33899,v1:4;n:type:ShaderForge.SFN_Vector1,id:281,x:31807,y:33164,v1:2;n:type:ShaderForge.SFN_Multiply,id:290,x:31492,y:33082|A-78-B,B-281-OUT;proporder:2-3-9-30-78;pass:END;sub:END;*/

Shader "Shader Forge/JiGuangXian_02" {
    Properties {
        _node_2 ("node_2", 2D) = "white" {}
        _node_3 ("node_3", 2D) = "white" {}
        _node_9 ("node_9", 2D) = "white" {}
        _node_30 ("node_30", 2D) = "white" {}
        _node_78 ("node_78", 2D) = "white" {}
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
            uniform sampler2D _node_3; uniform float4 _node_3_ST;
            uniform sampler2D _node_9; uniform float4 _node_9_ST;
            uniform sampler2D _node_30; uniform float4 _node_30_ST;
            uniform sampler2D _node_78; uniform float4 _node_78_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_336 = i.uv0;
                float4 node_337 = _Time + _TimeEditor;
                float2 node_4 = (node_336.rg+node_337.g*float2(0.06,0.3));
                float2 node_5 = (node_336.rg+node_337.g*float2(0.03,-1));
                float2 node_7 = ((node_336.rg+node_337.g*float2(0,-0.1))+(tex2D(_node_2,TRANSFORM_TEX(node_4, _node_2)).r*tex2D(_node_3,TRANSFORM_TEX(node_5, _node_3)).r));
                float2 node_79 = (node_336.rg+node_337.g*float2(0,-1.5));
                float4 node_78 = tex2D(_node_78,TRANSFORM_TEX(node_79, _node_78));
                float node_281 = 2.0;
                float3 emissive = (tex2D(_node_30,TRANSFORM_TEX(node_336.rg, _node_30)).rgb*((tex2D(_node_9,TRANSFORM_TEX(node_7, _node_9)).rgb*float3(0.5514706,0.410359,0.1986916))+(node_78.b*float3(0.875,0.6408088,0.2895221)*node_281)));
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
