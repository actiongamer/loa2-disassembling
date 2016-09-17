package nslm2.modules.footstones.driverInfoModules
{
   import game.ui.driverInfoModules.DriverInfoModuleUI;
   import morn.customs.expands.MornExpandUtil;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import flash.events.Event;
   import com.mz.core.mgrs.UIMgr;
   
   public class DriverInfoModule extends DriverInfoModuleUI
   {
       
      
      public function DriverInfoModule()
      {
         super();
         this.cover.fillAlpha = 0;
         this.box.fillAlpha = 0;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.btn_close.clickHandler = clickHandler;
         super.preShow(param1);
         MornExpandUtil.setLayout(this);
      }
      
      private function clickHandler(param1:Button) : void
      {
         ModuleMgr.ins.closeModule(this.moduleId);
      }
      
      override protected function onResize(param1:Event) : void
      {
         super.onResize(param1);
         box.x = (UIMgr.gameWidth - 679) / 2;
         box.y = (UIMgr.gameHeight - 407) / 2;
         this.btn_close.x = this.box.x + 679 - this.btn_close.width;
         this.btn_close.y = this.box.y;
      }
      
      override public function getFocusNotices() : Array
      {
         return ["msg_game_resize"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_game_resize" !== _loc3_)
         {
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         var _loc2_:* = param1;
         if(1 !== _loc2_)
         {
            if(2 === _loc2_)
            {
               box.addChild(new DriverInfoPanel2());
            }
         }
         else
         {
            box.addChild(new DriverInfoPanel1());
         }
         onResize(null);
      }
   }
}
