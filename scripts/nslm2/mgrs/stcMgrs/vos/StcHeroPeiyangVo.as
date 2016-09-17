package nslm2.mgrs.stcMgrs.vos
{
   import nslm2.mgrs.stcMgrs.StcVoBase;
   
   public class StcHeroPeiyangVo extends StcVoBase
   {
      
      public static const PRIMARY_KEY:String = "id";
      
      public static const STC_NAME:String = "static_hero_peiyang";
       
      
      public var id:int;
      
      public var attr_type:int;
      
      public var attr_value:Number;
      
      public var putong:String;
      
      public var gaoji:String;
      
      public var zhizun:String;
      
      public function StcHeroPeiyangVo()
      {
         super();
      }
      
      override public function parse(param1:Array) : void
      {
         id = param1[0];
         attr_type = param1[1];
         attr_value = param1[2];
         putong = param1[3];
         gaoji = param1[4];
         zhizun = param1[5];
      }
   }
}
