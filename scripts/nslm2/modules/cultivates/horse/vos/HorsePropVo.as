package nslm2.modules.cultivates.horse.vos
{
   import game.ui.roleInfos.NpcPropVo;
   
   public class HorsePropVo
   {
       
      
      public var npcPropVo:NpcPropVo;
      
      public var horseId:int;
      
      public function HorsePropVo(param1:NpcPropVo, param2:int)
      {
         super();
         npcPropVo = param1;
         horseId = param2;
      }
      
      public static function initFromNpcPropVoArr(param1:Array, param2:int) : Array
      {
         var _loc3_:Array = [];
         var _loc6_:int = 0;
         var _loc5_:* = param1;
         for each(var _loc4_ in param1)
         {
            _loc3_.push(new HorsePropVo(_loc4_,param2));
         }
         return _loc3_;
      }
   }
}
