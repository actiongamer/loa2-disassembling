package nslm2.modules.footstones.tooltipsModules
{
   import com.mz.core.utils2.task.TaskBase;
   import flash.display.DisplayObjectContainer;
   import nslm2.modules.footstones.tooltipsModules.servers.TooltipServerBase;
   import nslm2.modules.footstones.tooltipsModules.uis.ITooltipUI;
   import flash.display.DisplayObject;
   
   public class TooltipShowTask extends TaskBase
   {
       
      
      public var parent:DisplayObjectContainer;
      
      public var configVo:nslm2.modules.footstones.tooltipsModules.TooltipConfigVo;
      
      public var tooltipData;
      
      private var serverData = null;
      
      public var ui:ITooltipUI;
      
      public function TooltipShowTask(param1:DisplayObjectContainer, param2:nslm2.modules.footstones.tooltipsModules.TooltipConfigVo, param3:*)
      {
         super();
         this.parent = param1;
         this.configVo = param2;
         this.tooltipData = param3;
      }
      
      override public function exec() : void
      {
         var _loc1_:* = null;
         super.exec();
         if(this.configVo.serverTaskClass != null)
         {
            _loc1_ = new this.configVo.serverTaskClass(this.configVo,this.tooltipData);
            _loc1_.addCompleteHandler(serverTask_cpl).exec();
         }
         else
         {
            this.showUI();
         }
      }
      
      private function serverTask_cpl(param1:TaskBase) : void
      {
         if(this.isStop)
         {
            return;
         }
         this.serverData = param1.dataSource;
         this.showUI();
      }
      
      private function showUI() : void
      {
         if(this.isStop)
         {
            return;
         }
         ui = new configVo.uiClass();
         parent.addChild(ui as DisplayObject);
         ui.show(this.tooltipData,this.serverData);
         ui.fadeIn();
         this.onComplete();
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(ui)
         {
            ui.dispose();
            ui = null;
         }
      }
   }
}
