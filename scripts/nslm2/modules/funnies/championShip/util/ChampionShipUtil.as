package nslm2.modules.funnies.championShip.util
{
   import morn.core.components.View;
   import nslm2.modules.funnies.championShip.view.IProgressLine;
   import morn.core.components.Button;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import proto.CompeteStageDisplayInfo;
   
   public class ChampionShipUtil
   {
       
      
      public function ChampionShipUtil()
      {
         super();
      }
      
      public static function initView(param1:View, param2:int, param3:int) : void
      {
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc4_:* = null;
         _loc6_ = 1;
         while(_loc6_ <= param2)
         {
            _loc5_ = param1["line_" + _loc6_];
            if(_loc5_)
            {
               _loc5_.lineColor = 7556635;
               _loc5_.highlight = false;
            }
            _loc6_++;
         }
         _loc6_ = 1;
         while(_loc6_ <= param3)
         {
            _loc4_ = param1["btn_" + _loc6_];
            if(_loc4_)
            {
               _loc4_.disabled = true;
            }
            _loc6_++;
         }
      }
      
      public static function updateProgressLine(param1:View) : void
      {
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc5_:* = null;
         var _loc3_:Array = ChampionShipModel.ins.getGroupCompeData().stages;
         _loc3_.sortOn("frontStageIndex",16);
         var _loc7_:int = _loc3_.length;
         var _loc4_:CompeteStageDisplayInfo = _loc3_[0] as CompeteStageDisplayInfo;
         var _loc2_:Array = [];
         if(_loc4_.winnerIndex >= 0)
         {
            _loc2_.push(_loc4_.winnerIndex);
            _loc8_ = _loc3_[_loc4_.winnerIndex];
            while(_loc8_ && _loc8_.winnerIndex)
            {
               _loc2_.push(_loc8_.winnerIndex);
               _loc8_ = _loc3_[_loc8_.winnerIndex];
            }
         }
         _loc9_ = 0;
         while(_loc9_ < _loc7_)
         {
            _loc5_ = _loc3_[_loc9_];
            if(_loc5_.winnerIndex > 0)
            {
               _loc6_ = param1["line_" + _loc5_.winnerIndex];
               _loc6_.lineColor = 14002719;
               if(_loc2_.indexOf(_loc5_.winnerIndex) >= 0)
               {
                  _loc6_.highlight = true;
               }
               else
               {
                  _loc6_.highlight = false;
               }
            }
            _loc9_++;
         }
      }
   }
}
