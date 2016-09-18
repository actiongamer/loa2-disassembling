package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.modules.fightPlayer.UnitView;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import flash.geom.Point;
   
   public class ScriptCmd_ShowNpc extends ScriptCmdBase
   {
       
      
      private var unit:UnitView;
      
      private var unitArr:Array;
      
      public function ScriptCmd_ShowNpc()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         unitArr = this.findEleArr();
         if(this.vo.x != 0 || this.vo.y != 0)
         {
            setXY(this.vo.x,this.vo.y);
         }
         this.setVisible(true);
         this.onEnd();
      }
      
      private function setXY(param1:int, param2:int) : void
      {
         var _loc5_:int = 0;
         var _loc3_:* = null;
         var _loc4_:int = unitArr.length;
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc3_ = unitArr[_loc5_];
            _loc3_.xy = new Point(param1,param2);
            _loc5_++;
         }
      }
      
      private function setVisible(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = unitArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = unitArr[_loc4_];
            _loc2_.visible = param1;
            _loc4_++;
         }
      }
   }
}
