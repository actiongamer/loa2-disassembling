package nslm2.modules.cultivates.horse
{
   import game.ui.horseModules.HorseMainModuleUI;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comps2d.others.RedPoint;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.Component;
   import flash.display.DisplayObject;
   import nslm2.modules.roleInfos.commons.IRoleSubPanel;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.modules.cultivates.horse.horseChange.HorseChangePanel;
   import nslm2.modules.cultivates.horse.horseMaster.HorseMasterPanel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class HorseMainModule extends HorseMainModuleUI
   {
       
      
      private var panel3D:UIPanel3D;
      
      private var avatar:UIUnit3D;
      
      private var subViewStack:ViewStack;
      
      private var _redPoint:RedPoint;
      
      private var bgSkinArr:Array;
      
      public function HorseMainModule()
      {
         subViewStack = new ViewStack();
         _redPoint = new RedPoint();
         bgSkinArr = ["img_bg.jpg"];
         super();
         subViewStack.createSubViewCallBack = initSubView;
         subViewStack.subViewClasses = [HorseChangePanel,HorseMasterPanel];
         this.tabBar.selectHandler = onTabChanged;
         FuncOpenAutoCtrl.checkFuncTabNew([30300,30320],tabBar);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         new GetResTask(1,UrlLib.moduleImgAsset(30810,bgSkinArr[0])).addCompleteHandler(bgLoaded).exec();
      }
      
      private function bgLoaded(param1:GetResTask) : void
      {
         this.img_bg.url = param1.url;
         this.panelBg.titleImgId = this.moduleId;
         this.panelBg.bgCustom.addChild(this.img_bg);
         this.addChildAt(subViewStack,2);
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_bg);
         panel3D.initByImage(img_bg,this.panelBg);
         panel3D.visible = false;
         avatar = new UIUnit3D();
         panel3D.addChild3D(avatar);
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         if(HorseService.ins.canShengjie() || HorseService.ins.canLevelUp())
         {
            _redPoint.top = -2;
            _redPoint.right = -2;
            (this.tabBar.items[1] as Component).addChild(_redPoint);
         }
         else
         {
            DisplayUtils.removeSelf(_redPoint);
         }
         this.preShowCpl();
      }
      
      private function initSubView(param1:DisplayObject) : void
      {
         var _loc2_:IRoleSubPanel = param1 as IRoleSubPanel;
         _loc2_.layer3dRef = this.panel3D;
      }
      
      private function onTabChanged(param1:int) : void
      {
         subViewStack.selectedIndex = param1;
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         panel3D.visible = true;
         NGUtil.checkModuleShow(30300,null);
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         subViewStack.selectedIndex = 0;
         super.moduleFadeInTypeCpl();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("horse_change_master_page" !== _loc4_)
         {
            if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
            {
               _loc3_ = param2 as SwitchModuleRedPointMsg;
               if(_loc3_.moduleId == 30300)
               {
                  if(_loc3_.vis)
                  {
                     _redPoint.top = -2;
                     _redPoint.right = -2;
                     (this.tabBar.items[1] as Component).addChild(_redPoint);
                  }
                  else
                  {
                     DisplayUtils.removeSelf(_redPoint);
                  }
               }
            }
         }
         else
         {
            this.tabBar.selectedIndex = 1;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat("horse_change_master_page","MSG_SWITCH_MODULE_REN_POINT");
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this.panel3D.dispose();
         this.panel3D = null;
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         super.preClose(param1);
      }
   }
}
