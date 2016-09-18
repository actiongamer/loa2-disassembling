package nslm2.modules.footstones.alerts
{
   import game.ui.alerts.MsgTopCenterModuleUI;
   import nslm2.common.ui.components.comps2d.HorseLampH;
   import flash.events.Event;
   import com.mz.core.utils.DisplayUtils;
   
   public class MsgTopCenterModule extends MsgTopCenterModuleUI
   {
       
      
      private var _horseLamp:HorseLampH;
      
      public function MsgTopCenterModule()
      {
         super();
         this.mouseEvent = false;
         _horseLamp = new HorseLampH(20,4);
         _horseLamp.speed = 4;
         _horseLamp.addEventListener("end",horseLampH_end);
         _horseLamp.isLoop = false;
         _horseLamp.useImgFlag = false;
         _horseLamp.txtGap = 60;
         DisplayUtils.addChildAbove(_horseLamp,this.bg);
         _horseLamp.width = this.bg.width - 38;
         _horseLamp.x = this.bg.x + 24;
         _horseLamp.y = this.bg.y + 9;
         this.visible = false;
         _horseLamp.hack();
         this.centerX = 0;
         this.y = 100;
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_TOP_CENTER_HORSE_LAMP"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_TOP_CENTER_HORSE_LAMP" === _loc3_)
         {
            _horseLamp.add(param2);
            this.visible = true;
         }
      }
      
      private function horseLampH_end(param1:Event) : void
      {
         this.visible = false;
      }
   }
}
