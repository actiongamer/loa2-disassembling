package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class Stc2dSpecialEffectVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_2d_special_effect";
       
      
      public var id:int;
      
      public var path:String;
      
      public var frame_rate:int;
      
      public var blendmode:String;
      
      public function Stc2dSpecialEffectVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         path = param1[1];
         frame_rate = param1[2];
         blendmode = param1[3];
      }
   }
}
