package nslm2.modules.funnies.tencent
{
   import game.ui.TencentModule.TencentVipModuleUI;
   import morn.core.components.ViewStack;
   import nslm2.modules.funnies.tencent.model.TencentVipModel;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.funnies.tencent.model.QQVipModuleParam;
   import nslm2.modules.funnies.tencent.consts.QQVipUtils;
   import nslm2.modules.funnies.tencent.view.TencentVipGiftView;
   import nslm2.modules.funnies.tencent.view.TencentVipRewardView;
   import nslm2.modules.funnies.tencent.view.TencentVipLvlUpGiftView;
   import nslm2.modules.funnies.tencent.view.TencentVipRightsView;
   
   public class TencentVipModule extends TencentVipModuleUI
   {
       
      
      private var vs:ViewStack;
      
      public function TencentVipModule()
      {
         super();
         vs = new ViewStack();
         vs.x = 195;
         vs.y = 41;
         vs.subViewClasses = [TencentVipGiftView,TencentVipRewardView,TencentVipLvlUpGiftView,TencentVipRightsView];
         addChild(vs);
         this.list_title.changeHandler = listClickHandler;
      }
      
      private function listClickHandler() : void
      {
         this.vs.selectedIndex = list_title.selectedIndex;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         TencentVipModel.ins.getQQGiftInfo(getQQInfoCpl);
      }
      
      private function getQQInfoCpl() : void
      {
         this.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         this.panelBg.titleImgId = EnvConfig.ins.vipType == 2?60719:60718;
         this.img_backpanel.skin = UrlLib.getTencentImg("img_backpanel");
         this.img_bg.skin = UrlLib.getQQVipImg("img_bg");
         this.list_title.dataSource = [0,1,2,3];
         this.txt_toQQVipOffical.text = LocaleMgr.ins.getStr(EnvConfig.ins.vipType == 1?60710102:60710602);
         this.txt_toQQVipOffical.mouseEvent = false;
         this.txt_toQQVipOfficalBg.buttonMode = true;
         txt_toQQVipOfficalBg.fillAlpha = 0;
         this.txt_toQQVipOfficalBg.addEventListener("click",txt_toQQVipOffical_onClick);
         reCountRedPoi();
         super.preShow(param1);
      }
      
      private function reCountRedPoi() : void
      {
         this.redPoi_newer.visible = NpcFuncService.ins.getVo(60712).count > 0;
         this.redPoi_daily.visible = NpcFuncService.ins.getVo(60714).count > 0 || NpcFuncService.ins.getVo(60715).count > 0;
         this.redPoi_lvUp.visible = NpcFuncService.ins.getVo(60713).count > 0;
      }
      
      override public function show(param1:Object = null) : void
      {
         var _loc2_:QQVipModuleParam = param1 as QQVipModuleParam;
         if(_loc2_)
         {
            switch(int(_loc2_.tabFuncId) - 60712)
            {
               case 0:
                  this.list_title.selectedIndex = 0;
                  break;
               case 1:
                  this.list_title.selectedIndex = 2;
                  break;
               case 2:
                  this.list_title.selectedIndex = 1;
                  break;
               default:
                  this.list_title.selectedIndex = 1;
                  break;
               default:
                  this.list_title.selectedIndex = 1;
                  break;
               default:
                  this.list_title.selectedIndex = 1;
                  break;
               default:
                  this.list_title.selectedIndex = 1;
                  break;
               default:
                  this.list_title.selectedIndex = 1;
                  break;
               case 8:
                  this.list_title.selectedIndex = 3;
            }
         }
         else
         {
            this.list_title.selectedIndex = 0;
         }
         this.vs.selectedIndex = this.list_title.selectedIndex;
         super.show(param1);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["MSG_QQ_VIP_TAB_CHANGE","MSG_NPC_FUNC_VO_CHANGE"]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("MSG_QQ_VIP_TAB_CHANGE" !== _loc3_)
         {
            if("MSG_NPC_FUNC_VO_CHANGE" === _loc3_)
            {
               reCountRedPoi();
            }
         }
         else
         {
            _loc3_ = param2;
            if(60712 !== _loc3_)
            {
               if(60714 !== _loc3_)
               {
                  if(60713 === _loc3_)
                  {
                     this.list_title.selectedIndex = 2;
                     this.vs.selectedIndex = 2;
                  }
               }
               else
               {
                  this.list_title.selectedIndex = 1;
                  this.vs.selectedIndex = 1;
               }
            }
            else
            {
               this.list_title.selectedIndex = 0;
               this.vs.selectedIndex = 0;
            }
         }
      }
      
      private function txt_toQQVipOffical_onClick(... rest) : void
      {
         QQVipUtils.toOffical();
      }
   }
}
