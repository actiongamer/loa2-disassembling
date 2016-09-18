package nslm2.modules.Chapters.treasureBox
{
   import com.mz.core.interFace.IDispose;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class TreasureBoxCtrlBase implements IDispose
   {
       
      
      private var _box;
      
      private var _vo;
      
      protected var moduleCloseState:int;
      
      public function TreasureBoxCtrlBase(param1:*, param2:* = null)
      {
         super();
         _box = param1;
         vo = param2;
         switchEventListener(true);
      }
      
      private function switchEventListener(param1:*) : void
      {
         if(param1)
         {
            _box.addEventListener("click",onBoxClick);
         }
         else
         {
            _box.removeEventListener("click",onBoxClick);
         }
      }
      
      protected function onBoxClick(param1:MouseEvent) : void
      {
         moduleCloseState = this.vo.state;
         if(this.vo.state == 2)
         {
            this.vo.state = 4;
         }
         refreshBox();
      }
      
      protected function moduleCloseHandler() : void
      {
         (this.vo as TreasureBoxVo).state = moduleCloseState;
         this.refreshBox();
      }
      
      protected function rewardHandler() : void
      {
      }
      
      public function set vo(param1:*) : void
      {
         this._vo = param1;
         refreshBox();
      }
      
      public function get vo() : *
      {
         return this._vo;
      }
      
      public function get box() : *
      {
         return this._box;
      }
      
      public function refreshBox() : void
      {
         _box.dataSource = vo;
      }
      
      public function refreshModule() : void
      {
         ObserverMgr.ins.sendNotice("evtModuleRefresh",vo);
      }
      
      public function dispose() : void
      {
         switchEventListener(false);
      }
   }
}
