package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcSpecialEffectVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_special_effect";
       
      
      public var id:int;
      
      public var tag:String;
      
      public var effect:String;
      
      public var over_time:int;
      
      public var scale:Number;
      
      public var playSpeed:int;
      
      public var revolve:int;
      
      public var topside:int;
      
      public var other:int;
      
      public var underfooting:int;
      
      public var emmiter_names:String;
      
      public function StcSpecialEffectVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         tag = param1[1];
         effect = param1[2];
         over_time = param1[3];
         scale = param1[4];
         playSpeed = param1[5];
         revolve = param1[6];
         topside = param1[7];
         other = param1[8];
         underfooting = param1[9];
         emmiter_names = param1[10];
      }
   }
}
