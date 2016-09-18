package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.BattlefieldReport.render.BattlefieldReportTabRenderUI;
   import com.mz.core.utils.FilterUtil;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.battles.battlefields.msgs.BattlefieldMsgs;
   import com.mz.core.mediators.RollMediator;
   
   public class BattlefieldReportTabRender extends BattlefieldReportTabRenderUI
   {
       
      
      private var _nowShowSide:int;
      
      public function BattlefieldReportTabRender()
      {
         super();
         this.parts.push(new RollMediator(this,rollHandler));
         BattlefieldMsgs.ins.addEventListener("msgBattlefieldReportTabChanged",onSideChanged);
      }
      
      private function get side() : int
      {
         return this.dataSource as int;
      }
      
      private function rollHandler(param1:Boolean) : void
      {
         if(_nowShowSide == this.side)
         {
            return;
         }
         if(param1)
         {
            this.img_bg.scale = 1;
            this.img_icon.scale = 1;
            this.filters = [FilterUtil.getLightFilter(0.2)];
         }
         else
         {
            this.img_bg.scale = 0.9;
            this.img_icon.scale = 0.9;
            this.filters = [];
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1)
         {
            this.img_bg.skin = UrlLib.battlefieldSideBg(side);
            this.img_icon.skin = UrlLib.battlefieldSideIcon(side);
            this.txt_teamName.text = LocaleMgr.ins.getStr(50500900 + side);
         }
      }
      
      private function onSideChanged(param1:MzEvent) : void
      {
         if(dataSource)
         {
            _nowShowSide = param1.data as int;
            if(_nowShowSide == this.side)
            {
               this.img_bg.scale = 1;
               this.img_icon.scale = 1;
               this.filters = [FilterUtil.getLightFilter(0.2)];
            }
            else
            {
               this.img_bg.scale = 0.9;
               this.img_icon.scale = 0.9;
               this.filters = [];
            }
         }
      }
      
      override public function dispose() : void
      {
         BattlefieldMsgs.ins.removeEventListener("msgBattlefieldReportTabChanged",onSideChanged);
         super.dispose();
      }
   }
}
