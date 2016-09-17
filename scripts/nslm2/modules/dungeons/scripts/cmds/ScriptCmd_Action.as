package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.fightPlayer.UnitView;
   import flash.events.Event;
   
   public class ScriptCmd_Action extends ScriptCmdBase
   {
       
      
      private var unitArr:Array;
      
      private var loopArr:Array;
      
      public function ScriptCmd_Action()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         super.onStart(param1);
         unitArr = this.findEleArr();
         var _loc3_:int = unitArr.length;
         loopArr = ArrayUtil.fillBySameItem([],_loc3_,0);
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = unitArr[_loc4_];
            _loc2_.addEventListener("actionCpl",this.action_onCpl);
            if(this.vo.name == _loc2_.action)
            {
               _loc2_.onAction(this.vo.name == "run"?"hurt":"run");
            }
            _loc2_.onAction(this.vo.name);
            _loc4_++;
         }
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         if(this.vo.time > 0)
         {
            this.checkEnd();
         }
      }
      
      override public function onEnd() : void
      {
         var _loc3_:int = 0;
         var _loc1_:* = null;
         var _loc2_:int = unitArr.length;
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_ = unitArr[_loc3_];
            _loc1_.removeEventListener("actionCpl",this.action_onCpl);
            _loc3_++;
         }
         this.unitArr = null;
         this.loopArr = null;
         super.onEnd();
      }
      
      private function action_onCpl(param1:Event) : void
      {
         if(this._isEnd)
         {
            return;
         }
         var _loc2_:UnitView = param1.currentTarget as UnitView;
         var _loc3_:int = unitArr.indexOf(_loc2_);
         var _loc4_:int = this.loopArr[_loc3_];
         _loc4_++;
         if(_loc4_ >= this.vo.loop)
         {
            _loc2_.removeEventListener("actionCpl",this.action_onCpl);
            ArrayUtil.removeItemAt(this.unitArr,_loc3_);
            ArrayUtil.removeItemAt(this.loopArr,_loc3_);
         }
         else
         {
            this.loopArr[_loc3_] = _loc4_;
            _loc2_.onAction(this.vo.name == "run"?"hurt":"run");
            _loc2_.onAction(this.vo.name);
         }
         if(this.loopArr.length == 0)
         {
            this.onEnd();
         }
      }
   }
}
