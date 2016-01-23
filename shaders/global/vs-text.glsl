attribute vec4 textCoord;
attribute vec2 lookup;

uniform sampler2D t_lookup;

uniform vec3 repelerPos;
uniform mat4 bodyMatrix;
uniform vec2 windowSize;
uniform float letterWidth;
uniform float dpr;


uniform float time;

varying vec4 vTextCoord;
varying vec2 vUv;
varying vec3 vMPos;

const float bumpSize = 10.;
const float bumpHeight = 1.;

void main(){
  
  vUv         = uv;
  vTextCoord  = textCoord;
  
  vec3 pos = texture2D( t_lookup , lookup ).xyz;

  //mat4 mv = modelViewMatrix;

  /*mv[0][0] = 1.;
  mv[0][1] = 0.;
  mv[0][2] = 0.;
   
  // Column 1:
  mv[1][0] = 0.;
  mv[1][1] = 1.;
  mv[1][2] = 0.;
   
  // Column 2:
  mv[2][0] = 0.;
  mv[2][1] = 0.;
  mv[2][2] = 1.;*/

  /*gl_Position = gl_ProjectionMatrix 
               * (gl_ModelViewMatrix * vec4(0.0, 0.0, 0.0, 1.0) 
               + vec4(gl_Vertex.x, gl_Vertex.y, 0.0, 0.0)*/
  
  //pos = pos + position;//(modelMatrix * vec4( position , 1. )).xyz;



  vMPos =( modelMatrix * vec4( pos , 1. )).xyz;

  vec4 mv = modelViewMatrix * vec4( pos , 1. );

  float size = ( letterWidth * 1. * dpr);// length( mvPos );

  float fSize = size * windowSize.x / length( mv.xyz ) ;

  float ratio = windowSize.y / windowSize.x;

  vec4 mvPos =  vec4( pos.x , pos.y , 0.  , 0.0 );

  vec2 p = vec2(position.x * ratio , position.y );
 
  gl_Position = (projectionMatrix * mv ) + vec4(p * fSize * .13   , 0., 0.);




/*    vPos        = position;
  vec2 uv     = position.xy + .5/textureSize;
  vLookup     = texture2D( t_lookup , uv );
  vTextCoord  = textCoord;//texture2D( t_textCoord , uv );
  vTextOffset = textOffset;


  vec3 pos =vLookup.xyz;
  vec4 mvPos = modelViewMatrix * vec4( pos , 1.0 );
 

//vec4 mvPos = modelViewMatrix * vec4( position , 1.0 );

  gl_Position = projectionMatrix * mvPos;*/

}