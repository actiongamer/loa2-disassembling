package nslm2.modules.battles.battlefields.renders
{
   import game.ui.battlefield.render.BattlefieldFunBtnRenderUI;
   import game.ui.mainToolBar.ButtonWealhtRenderUI;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import flash.events.MouseEvent;
   import nslm2.modules.battles.battlefields.model.BattlefieldModel;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.battlefields.utils.BattlefieldUtil;
   import proto.TeamCreateReq;
   import nslm2.modules.funnies.teams.TeamService;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.customs.FilterLib;
   import nslm2.types.FunctionType;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRenderS3;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.mainToolBar.RedPointVo;
   import com.mz.core.utils.ArrayUtil;
   
   public class BattlefieldFunBtnRender extends BattlefieldFunBtnRenderUI
   {
       
      
      private var _wealthRender:ButtonWealhtRenderUI;
      
      private var rollMed:RoleGrowFilterMed;
      
      public var redPointArr:Vector.<RedPointVo>;
      
      public function BattlefieldFunBtnRender()
      {
         _wealthRender = new ButtonWealhtRenderUI();
         super();
         box_wealth.visible = false;
         _wealthRender.x = 5;
         _wealthRender.y = -4;
         this.box_wealth.addChild(_wealthRender);
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.buttonMode = true;
         rollMed = new RoleGrowFilterMed(this,null);
         this.parts.push(new RoleGrowFilterMed(this,null));
         this.addEventListener("click",icon_click);
      }
      
      private function icon_click(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         switch(int(this.moduleId) - 50501)
         {
            case 0:
               if(BattlefieldModel.ins.curTeamId != null)
               {
                  ModuleMgr.ins.showModule(50501,BattlefieldModel.ins.memInfos,ModuleMgr.ins.popLayer.curModuleId);
               }
               else if(BattlefieldUtil.canEnter())
               {
                  _loc2_ = new TeamCreateReq();
                  _loc2_.kind = 16;
                  TeamService.ins.teamCreate(_loc2_);
               }
               break;
            case 1:
               if(BattlefieldModel.ins.invitedNotifies.length == 0)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(50500105));
               }
               else
               {
                  ModuleMgr.ins.showModule(this.moduleId,null,ModuleMgr.ins.popLayer.curModuleId);
               }
               break;
            case 2:
               ModuleMgr.ins.showModule(this.moduleId,null,ModuleMgr.ins.popLayer.curModuleId);
               break;
            case 3:
               ModuleMgr.ins.showModule(60300,new ShopOpenVo(50504),ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.moduleId > 0)
         {
            this.toolTip = LocaleMgr.ins.getStr(9000000 + this.moduleId);
            this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId);
            _loc2_ = LocaleMgr.ins.getStr(9000000 + this.moduleId);
            this.txt_names.text = _loc2_;
            rollMed.glowFilter = FilterLib.BORDER_YELLOW;
         }
         else
         {
            this.toolTip = null;
            rollMed.glowFilter = null;
         }
         if(FunctionType.ALL_SHOP_ARR.indexOf(moduleId) != -1)
         {
            this.box_alert.visible = true;
            (this.box_alert as TaskAlertRenderS3).show(moduleId);
         }
         else
         {
            this.box_alert.visible = false;
         }
         if(!(int(moduleId) - 50504))
         {
            box_wealth.visible = true;
            _wealthRender.dataSource = WealthUtil.createStcVo(14);
         }
         else
         {
            box_wealth.visible = false;
         }
         this.validateRedPoint();
      }
      
      public function validateRedPoint() : void
      {
         var _loc1_:* = null;
         this.img_redPoi.visible = false;
         this.countPoint.visible = false;
         if(redPointArr)
         {
            if(this.moduleId > 0)
            {
               _loc1_ = ArrayUtil.findByAttr(redPointArr,"moduleID",moduleId);
               if(_loc1_)
               {
                  if(_loc1_.count > 0)
                  {
                     this.countPoint.visible = true;
                     this.countPoint.txt_count.text = _loc1_.count + "";
                     this.img_redPoi.visible = false;
                  }
                  else
                  {
                     this.countPoint.visible = false;
                     this.img_redPoi.visible = true;
                  }
               }
            }
         }
      }
      
      public function get moduleId() : int
      {
         return this.dataSource as int;
      }
      
      public function set moduleId(param1:int) : void
      {
         this.dataSource = param1;
      }
   }
}
