package nslm2.modules.foundations.playerHeaders
{
   import game.ui.playerHeaders.PlayerMilitaryRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import morn.customs.FilterLib;
   import nslm2.mgrs.skins.ColorLib;
   import morn.customs.StyleLib;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class PlayerMilitaryRender extends PlayerMilitaryRenderUI implements IObserver
   {
       
      
      private var _redPoint:RedPoint;
      
      private var rollMed:RoleGrowFilterMed;
      
      private var _skinPrefix:String;
      
      public function PlayerMilitaryRender()
      {
         _redPoint = new RedPoint();
         super();
         _skinPrefix = this.img_bg.skin.substr(0,this.img_bg.skin.length - 1);
         rollMed = new RoleGrowFilterMed(this.img_bg,FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(3)));
         this.parts.push(new RoleGrowFilterMed(this.img_bg,FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(3))));
         ObserverMgr.ins.regObserver(this);
         _redPoint.top = 1;
         _redPoint.right = 12;
         this.addChild(_redPoint);
         this.txt_badge.font = "Microsoft YaHei,微软雅黑";
         this.txt_badge.size = 14;
         refresh();
         this.buttonMode = true;
         this.img_bg.addEventListener("click",onMilitaryClick);
      }
      
      private function onMilitaryClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(30400);
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         if(PlayerModel.ins.playerInfo.militaryrank == 0)
         {
            this.toolTip = LocaleMgr.ins.getStr(999000331);
            _loc1_ = MilitaryModel.ins.getPlayerQuality(100);
            this.txt_badge.text = LocaleMgr.ins.getStr(MilitaryModel.ins.getMilitaryNameById(100));
         }
         else
         {
            _loc1_ = MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank);
            this.toolTip = new PlayerMilitaryVo(PlayerModel.ins.playerInfo.militaryrank);
            this.txt_badge.text = LocaleMgr.ins.getStr(MilitaryModel.ins.getMilitaryNameById(PlayerModel.ins.playerInfo.militaryrank));
         }
         rollMed.glowFilter = FilterLib.ins.getRollGrowByColor(ColorLib.qualityColor(_loc1_));
         this.img_bg.skin = _skinPrefix + _loc1_;
         this.txt_badge.style = StyleLib.ins.getStyleGQuality(_loc1_);
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_SWITCH_MODULE_REN_POINT","evtPlayerHeaderRefresh"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("MSG_SWITCH_MODULE_REN_POINT" !== _loc4_)
         {
            if("evtPlayerHeaderRefresh" === _loc4_)
            {
               refresh();
            }
         }
         else
         {
            _loc3_ = param2 as SwitchModuleRedPointMsg;
            if(_loc3_.moduleId == 30400)
            {
               _redPoint.visible = _loc3_.vis;
            }
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
