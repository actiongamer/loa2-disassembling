package nslm2.modules.foundations.recycle
{
   import game.ui.recycleModules.RecycleModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import morn.core.components.ViewStack;
   import nslm2.modules.foundations.recycle.view.panel.RecycleGetResPanel;
   import nslm2.modules.foundations.recycle.model.RecycleModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import flash.display.DisplayObject;
   import nslm2.modules.foundations.recycle.view.I3DSubPanel;
   import nslm2.modules.foundations.recycle.consts.RecycleConsts;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.modules.footstones.alerts.FloatUtil;
   import morn.core.components.Button;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.foundations.recycle.vo.RecycleVo;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import com.mz.core.event.MzEvent;
   import nslm2.common.uiEffects.ListIconFlyEff;
   import morn.customs.components.WealthRender;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.foundations.recycle.view.panel.heroRec.HeroRecylePanel;
   import nslm2.modules.foundations.recycle.view.panel.equipRec.EquipRecylePanel;
   import nslm2.modules.foundations.recycle.view.panel.heroReborn.HeroRebornPanel;
   import nslm2.modules.foundations.recycle.view.panel.treasureReborn.TreasureRebornPanel;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.foundations.recycle.view.panel.equipReborn.EquipRebornPanel;
   import nslm2.modules.foundations.recycle.view.panel.treasureRec.TreasureRecPanel;
   import nslm2.modules.foundations.recycle.view.panel.heroMirror.HeroMirrorPanel;
   import nslm2.modules.foundations.recycle.view.panel.petReborn.PetRebornPanel;
   import morn.customs.components.TabMed;
   
   public class RecycleModule extends RecycleModuleUI implements INewerGuideCheckHandler
   {
      
      private static const BTN_SKIN_1:String = "png.uiRecycle.btn_syShop";
      
      private static const BTN_SKIN_2:String = "png.uiRecycle.btn_jhShop";
       
      
      private var subViewStack:ViewStack;
      
      private var getResPanel:RecycleGetResPanel;
      
      private var model:RecycleModel;
      
      private var btnEff:BmcSpriteSheet;
      
      private var labelsArr:Array;
      
      private var tabType:Array;
      
      private var viewArr:Array;
      
      private var funcArr:Array;
      
      private var _panel3D:UIPanel3D;
      
      public function RecycleModule()
      {
         subViewStack = new ViewStack();
         model = RecycleModel.ins;
         labelsArr = [LocaleMgr.ins.getStr(11300005),LocaleMgr.ins.getStr(11300006),LocaleMgr.ins.getStr(11300016),LocaleMgr.ins.getStr(11300017)];
         tabType = [0,1,2,3];
         viewArr = [HeroRecylePanel,EquipRecylePanel,HeroRebornPanel,TreasureRebornPanel];
         funcArr = [-1,-1,-1,-1];
         super();
         tabBar.selectHandler = tabSelectHandler;
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         this.panelBg.titleImgId = 11300;
         model.resIcon = this.costRender;
         if(FuncOpenAutoCtrl.checkOpen(11307))
         {
            viewArr.push(EquipRebornPanel);
            labelsArr.push(LocaleMgr.ins.getStr(9011307));
            funcArr.push(11307);
            tabType.push(RecycleConsts.REC_TYPE_EQUIP_REBORN);
         }
         if(FuncOpenAutoCtrl.checkOpen(11308))
         {
            labelsArr.push(LocaleMgr.ins.getStr(12110036));
            viewArr.push(TreasureRecPanel);
            funcArr.push(11308);
            tabType.push(RecycleConsts.REC_TYPE_TREASURE);
         }
         if(FuncOpenAutoCtrl.checkOpen(11310))
         {
            labelsArr.push(LocaleMgr.ins.getStr(109001020));
            viewArr.push(HeroMirrorPanel);
            funcArr.push(11310);
            tabType.push(6);
         }
         if(FuncOpenAutoCtrl.checkOpen(11309))
         {
            labelsArr.push(LocaleMgr.ins.getStr(32000053));
            viewArr.push(PetRebornPanel);
            funcArr.push(11309);
            tabType.push(7);
         }
         tabBar.labels = labelsArr.join(",");
         FuncOpenAutoCtrl.checkFuncTabNew(funcArr,tabBar);
         subViewStack.subViewClasses = viewArr;
         var _loc1_:TabMed = new TabMed(tabBar);
         _loc1_.updateBtnsPosition();
      }
      
      private function initSubView(param1:DisplayObject) : void
      {
         if(param1 is I3DSubPanel)
         {
            (param1 as I3DSubPanel).layer3dRef = _panel3D;
         }
      }
      
      private function showRedPoint() : void
      {
         if(model.canAutoAddHeroCnt >= 5)
         {
            img_redPoint1.visible = true;
         }
         else
         {
            img_redPoint1.visible = false;
         }
         if(model.canAutoAddEquipCnt >= 5)
         {
            img_redPoint2.visible = true;
         }
         else
         {
            img_redPoint2.visible = false;
         }
      }
      
      private function showOrHideBtnEffect() : void
      {
         if(model.crtFunctionType == 0 && model.canAutoAddHeroCnt > 5 || model.crtFunctionType == 1 && model.canAutoAddEquipCnt > 5)
         {
            if(!btnEff)
            {
               btnEff = new BmcSpriteSheet();
               btnEff.x = 78;
               btnEff.y = 12;
               btnEff.init(115002,1,"all",true);
               box_destroyOp.addChild(btnEff);
            }
         }
         else if(btnEff)
         {
            btnEff.dispose();
            btnEff = null;
         }
      }
      
      private function tabSelectHandler(param1:Object) : void
      {
         model.crtFunctionType = tabType[tabBar.selectedIndex];
         subViewStack.selectedIndex = tabBar.selectedIndex;
         showRedPoint();
         box_destroyOp.visible = model.crtFunctionType < 2 || model.crtFunctionType == RecycleConsts.REC_TYPE_TREASURE;
         showOrHideBtnEffect();
         updateBottomTipText();
         box_shop.visible = model.crtFunctionType < 2;
         if(model.crtFunctionType == 0)
         {
            this.box_shop.visible = true;
            btn_shop.skin = "png.uiRecycle.btn_jhShop";
            this.costRender.dataSource = WealthUtil.createStcVo(15);
            this.box_rebornHint.visible = false;
         }
         else
         {
            if(model.crtFunctionType == 1 && FuncOpenAutoCtrl.checkOpen(30502))
            {
               this.box_rebornHint.visible = true;
            }
            else
            {
               this.box_rebornHint.visible = false;
            }
            btn_shop.skin = "png.uiRecycle.btn_syShop";
            this.costRender.dataSource = WealthUtil.createStcVo(12);
            if(model.crtFunctionType == 1 && FuncOpenAutoCtrl.checkOpen(11302))
            {
               this.box_shop.visible = true;
            }
            else
            {
               this.box_shop.visible = false;
            }
         }
      }
      
      private function updateBottomTipText() : void
      {
         var _loc1_:* = model.crtFunctionType;
         if(1 !== _loc1_)
         {
            if(0 !== _loc1_)
            {
               if(RecycleConsts.REC_TYPE_TREASURE === _loc1_)
               {
                  txt_tips.text = LocaleMgr.ins.getStr(30609302);
               }
            }
            else
            {
               txt_tips.text = LocaleMgr.ins.getStr(11300007);
            }
         }
         else
         {
            txt_tips.text = LocaleMgr.ins.getStr(11300008);
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["recycle_notice_show_select_panel","recycle_notice_show_reward","recycle_notice_confirm","MSG_SWITCH_MODULE_REN_POINT"]);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         _panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(_panel3D,this.img_bg);
         _panel3D.initByImage(img_bg,this.panelBg);
         _panel3D.visible = false;
         DisplayUtils.addChildAbove(subViewStack,_panel3D);
         subViewStack.createSubViewCallBack = initSubView;
         this.box_shop.visible = false;
         if(param1 != null)
         {
            if(param1 is int)
            {
               _loc2_ = param1;
            }
            else
            {
               _loc2_ = param1["index"];
            }
         }
         subViewStack.x = 15;
         subViewStack.y = 66;
         subViewStack.selectedIndex = _loc2_;
         tabBar.selectedIndex = _loc2_;
         RecycleModel.ins.crtFunctionType = tabType[_loc2_];
         super.preShow(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         _panel3D.visible = true;
         super.show(param1);
         showRedPoint();
         showOrHideBtnEffect();
         if(model.crtFunctionType == 0)
         {
            this.costRender.dataSource = WealthUtil.countVo(15);
         }
         else
         {
            this.costRender.dataSource = WealthUtil.countVo(12);
         }
         NGUtil.checkModuleShow(this.moduleId,this);
         RecycleModel.ins.sortIdleHero();
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("recycle_notice_show_select_panel" !== _loc4_)
         {
            if("recycle_notice_show_reward" !== _loc4_)
            {
               if("recycle_notice_confirm" !== _loc4_)
               {
                  if("MSG_SWITCH_MODULE_REN_POINT" === _loc4_)
                  {
                     showRedPoint();
                  }
               }
               else
               {
                  setBtnEnable(true);
               }
            }
            else
            {
               _loc4_ = RecycleModel.ins.crtFunctionType;
               if(0 !== _loc4_)
               {
                  if(1 !== _loc4_)
                  {
                     if(RecycleConsts.REC_TYPE_TREASURE !== _loc4_)
                     {
                        if(2 !== _loc4_)
                        {
                           if(3 !== _loc4_)
                           {
                           }
                        }
                        _loc3_ = LocaleMgr.ins.getStr(999000823);
                     }
                     addr56:
                     FloatUtil.showGetItemsDisplayPanel(param2,_loc3_,getToTargetHandler,0,true,0,false);
                     setBtnEnable(false);
                     showOrHideBtnEffect();
                     NGUtil.checkModuleShow(this.moduleId,this);
                  }
                  addr23:
                  _loc3_ = LocaleMgr.ins.getStr(999000822);
                  §§goto(addr56);
               }
               §§goto(addr23);
            }
         }
         else
         {
            showSelectPanel();
         }
      }
      
      private function setBtnEnable(param1:Boolean) : void
      {
         var _loc2_:* = param1;
         btn_autoAdd.disabled = _loc2_;
         btn_recycle.disabled = _loc2_;
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_autoAdd !== _loc2_)
         {
            if(btn_recycle !== _loc2_)
            {
               if(btn_help !== _loc2_)
               {
                  if(btn_shop === _loc2_)
                  {
                     if(this.tabBar.selectedIndex == 0)
                     {
                        ModuleMgr.ins.showModule(60310,null,ModuleMgr.ins.popLayer.curModuleId);
                     }
                     else
                     {
                        ModuleMgr.ins.showModule(60300,new ShopOpenVo(11306),ModuleMgr.ins.popLayer.curModuleId);
                     }
                  }
               }
               else
               {
                  RecycleUtil.showHelp();
               }
            }
            else if(checkSelectItem())
            {
               ModuleMgr.ins.showModule(11304,null,11300);
            }
         }
         else
         {
            autoAdd();
            if(btnEff)
            {
               btnEff.dispose();
               btnEff = null;
            }
            NGUtil.checkModuleShow(this.moduleId);
            ObserverMgr.ins.sendNotice("recycle_notice_update_list");
         }
      }
      
      private function checkSelectItem() : Boolean
      {
         var _loc1_:* = model.crtFunctionType;
         if(0 !== _loc1_)
         {
            if(1 !== _loc1_)
            {
               if(RecycleConsts.REC_TYPE_TREASURE === _loc1_)
               {
                  if(model.selectedTreasureIdList.length > 0)
                  {
                     return true;
                  }
                  AlertUtil.float(LocaleMgr.ins.getStr(999000583));
               }
            }
            else
            {
               if(model.selectedEquipIdList.length > 0)
               {
                  return true;
               }
               AlertUtil.float(LocaleMgr.ins.getStr(11300033));
            }
         }
         else
         {
            if(model.selectedHeroIdList.length > 0)
            {
               return true;
            }
            AlertUtil.float(LocaleMgr.ins.getStr(11300032));
         }
         return false;
      }
      
      private function autoAdd() : void
      {
         var _loc1_:* = model.crtFunctionType;
         if(0 !== _loc1_)
         {
            if(1 !== _loc1_)
            {
               if(RecycleConsts.REC_TYPE_TREASURE === _loc1_)
               {
                  if(model.selectedTreasureIdList.length >= 5)
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(999902514));
                     return;
                  }
                  if(checkAddTreasure())
                  {
                     if(!model.checkHasMoreTreasure())
                     {
                        AlertUtil.float(LocaleMgr.ins.getStr(11300037));
                        return;
                     }
                     model.autoAddTreasure();
                  }
               }
            }
            else
            {
               if(model.selectedEquipIdList.length >= 5)
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(11300031));
                  return;
               }
               if(checkAddEquip())
               {
                  if(!model.checkHasMoreEquip())
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(11300037));
                     return;
                  }
                  model.autoAddEquip();
               }
            }
         }
         else
         {
            if(model.selectedHeroIdList.length >= 5)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(11300030));
               return;
            }
            if(checkAddHero())
            {
               if(!model.checkHasMoreHero())
               {
                  AlertUtil.float(LocaleMgr.ins.getStr(11300036));
                  return;
               }
               model.autoAddHero();
            }
         }
      }
      
      private function checkAddHero() : Boolean
      {
         if(model.idleHeroList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(11300034));
            return false;
         }
         return true;
      }
      
      private function checkAddEquip() : Boolean
      {
         if(model.idleEquiList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(11300035));
            return false;
         }
         return true;
      }
      
      private function checkAddTreasure() : Boolean
      {
         if(model.canRecTreasureList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000600));
            return false;
         }
         return true;
      }
      
      private function checkAddRebornEquip() : Boolean
      {
         if(model.idleCanRebornEquipList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000601));
            return false;
         }
         return true;
      }
      
      private function checkChangeHero() : Boolean
      {
         var _loc1_:Array = model.idleHeroList.filter(filFunc);
         if(_loc1_.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(109001014));
            return false;
         }
         return true;
      }
      
      private function filFunc(param1:RecycleVo, param2:int, param3:Array) : Boolean
      {
         if(param1.heroBaseInfo.level != 1 || param1.tupoLvl != 0 || param1.phaseLvl != 1 || RecycleConsts.CAN_CHANGE_HERO_QUALITY.indexOf(param1.wealthVo.quality) == -1 || RecycleModel.ins.rewardHeroId == param1.heroBaseInfo.baseId)
         {
            return false;
         }
         return true;
      }
      
      private function checkRebornHero() : Boolean
      {
         if(model.rebornHeroList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(11300041));
            return false;
         }
         return true;
      }
      
      private function checkRebornTreasure() : Boolean
      {
         if(model.rebornTreasureList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000599));
            return false;
         }
         return true;
      }
      
      private function checkRecTreasure() : Boolean
      {
         if(model.canRecTreasureList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000600));
            return false;
         }
         return true;
      }
      
      private function checkAddRebornPet() : Boolean
      {
         if(PetModel.ins.canRebornPetList.length == 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(11300058));
            return false;
         }
         return true;
      }
      
      private function showSelectPanel() : void
      {
         var _loc1_:* = model.crtFunctionType;
         if(0 !== _loc1_)
         {
            if(1 !== _loc1_)
            {
               if(6 !== _loc1_)
               {
                  if(RecycleConsts.REC_TYPE_EQUIP_REBORN !== _loc1_)
                  {
                     if(RecycleConsts.REC_TYPE_EQUIP_REBORN !== _loc1_)
                     {
                        if(2 !== _loc1_)
                        {
                           if(3 !== _loc1_)
                           {
                              if(RecycleConsts.REC_TYPE_TREASURE !== _loc1_)
                              {
                                 if(7 === _loc1_)
                                 {
                                    if(checkAddRebornPet())
                                    {
                                       ModuleMgr.ins.showModule(11309,null,11300);
                                    }
                                 }
                              }
                              else if(checkRecTreasure())
                              {
                                 ModuleMgr.ins.showModule(11308,null,11300);
                              }
                           }
                           else if(checkRebornTreasure())
                           {
                              ModuleMgr.ins.showModule(11305,null,11300);
                           }
                        }
                        else if(checkRebornHero())
                        {
                           ModuleMgr.ins.showModule(11303,null,11300);
                        }
                     }
                     else if(checkAddEquip())
                     {
                        ModuleMgr.ins.showModule(11302,null,11300);
                     }
                  }
                  else if(checkAddRebornEquip())
                  {
                     ModuleMgr.ins.showModule(11305,true,11300);
                  }
               }
               else if(checkChangeHero())
               {
                  ModuleMgr.ins.showModule(11310,RecycleModel.ins.idleHeroList.filter(filFunc),11300);
               }
            }
            else if(checkAddEquip())
            {
               ModuleMgr.ins.showModule(11302,null,11300);
            }
         }
         else if(checkAddHero())
         {
            ModuleMgr.ins.showModule(11301,null,11300);
         }
      }
      
      protected function onResPanelDispose(param1:MzEvent) : void
      {
         getResPanel = null;
      }
      
      private function getToTargetHandler(param1:ListIconFlyEff, param2:WealthRender) : *
      {
         if(param2.wealthVoIsEnable)
         {
            switch(int(param2.wealthVo.kind) - 12)
            {
               case 0:
                  return RecycleModel.ins.resIcon;
               default:
               default:
                  return ListIconFlyEff.getToTargetFromWealthRender(param1,param2);
               case 3:
                  return RecycleModel.ins.resIcon;
            }
         }
         else
         {
            return null;
         }
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         if(!(int(param1) - 10210))
         {
            if(model.checkHasMoreHero() == false)
            {
               return 0;
            }
         }
         return 1;
      }
      
      override public function preClose(param1:Object = null) : void
      {
         _panel3D.dispose();
         _panel3D = null;
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         model.dispose();
         model = null;
      }
   }
}
