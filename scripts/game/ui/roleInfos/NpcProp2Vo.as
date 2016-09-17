package game.ui.roleInfos
{
   import flash.geom.Point;
   
   public class NpcProp2Vo extends NpcPropVo
   {
      
      public static const VALUE_NEXT:String = "valueNext";
       
      
      public var valueNext:Number;
      
      public function NpcProp2Vo(param1:int, param2:Number, param3:Number, param4:String = "", param5:Point = null, param6:Boolean = false)
      {
         super(param1,param2,param4);
         this.valueNext = param3;
         this.floatPos = param5;
      }
      
      public static function parseTwoPropArr(param1:Array, param2:Array, param3:Boolean = true, param4:Boolean = false) : Array
      {
         var _loc9_:int = 0;
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc6_:Array = [];
         var _loc8_:int = Math.max(param1.length,param2.length);
         _loc9_ = 0;
         while(_loc9_ < _loc8_)
         {
            _loc5_ = param1[_loc9_];
            _loc7_ = param2[_loc9_];
            if(_loc5_ == null)
            {
               _loc6_.push(new NpcProp2Vo(_loc7_.propId,0,_loc7_.oriValue,_loc7_.preFix,null,param4));
            }
            else if(_loc7_ == null)
            {
               _loc6_.push(new NpcProp2Vo(_loc5_.propId,_loc5_.oriValue,0,_loc5_.preFix,_loc5_.floatPos,param4));
            }
            else
            {
               _loc6_.push(new NpcProp2Vo(_loc5_.propId,_loc5_.oriValue,_loc7_.value,_loc5_.preFix,_loc5_.floatPos,param4));
            }
            _loc9_++;
         }
         if(param3)
         {
            _loc6_.sortOn("propId",16);
         }
         return _loc6_;
      }
   }
}
