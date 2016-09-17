package nslm2.modules.cultivates.heroBag
{
   import game.ui.heroShowModule.HeroShowModuleUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideCheckHandler;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.roleInfos.levelUps.RoleLevelUpUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.modules.cultivates.roleTeam.ctrl.CheckRoleTeamRedPointCtrl;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleNewMsg;
   import flash.events.Event;
   import morn.core.components.Image;
   import nslm2.common.uiEffects.IconFlyEff;
   import flash.geom.Point;
   import nslm2.common.compsEffects.ListCellTweenEffect;
   import nslm2.common.uiEffects.ArriveTickEff;
   import flash.display.DisplayObject;
   import nslm2.common.vo.WealthVo;
   import nslm2.utils.Uint64Util;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS2;
   import nslm2.modules.footstones.newerAlertModules.NewerAlertModel;
   import morn.core.components.Component;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class HeroShowModule extends HeroShowModuleUI implements INewerGuideCheckHandler, INewerGuideGetComp
   {
       
      
      private var _renderArr:Array;
      
      private var _repeatYArr:Array;
      
      public function HeroShowModule()
      {
         _renderArr = [HeroShowRender,HeroPieceRender];
         _repeatYArr = [2,3];
         super();
         this.tabBar.selectHandler = onTabBarChanged;
         this.pageBarS2.bindList(this.list_items);
         this.fadeViewId = 11010;
         MornExpandUtil.addHandlerForBtnAll(this,onBtnClick);
         this.tabBar.labels = LocaleMgr.ins.getStr(998000050);
         txt_volume.text = LocaleMgr.ins.getStr(350000007,[]);
         txt_support.text = LocaleMgr.ins.getStr(30815000);
      }
      
      private function onBtnClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_recycle !== _loc2_)
         {
            if(this.btn_reborn !== _loc2_)
            {
               if(this.btn_preview !== _loc2_)
               {
                  if(this.btn_recommand !== _loc2_)
                  {
                     if(this.btn_support !== _loc2_)
                     {
                        if(this.btn_shardDonate === _loc2_)
                        {
                           ModuleMgr.ins.showModule(40700,"heroShard");
                        }
                     }
                     else
                     {
                        ModuleMgr.ins.showModule(30815,null,ModuleMgr.ins.popLayer.curModuleId);
                     }
                  }
                  else
                  {
                     ModuleMgr.ins.showModule(14000,null,ModuleMgr.ins.popLayer.curModuleId);
                  }
               }
               else
               {
                  ModuleMgr.ins.showModule(11930,null,ModuleMgr.ins.popLayer.curModuleId);
               }
            }
            else
            {
               ModuleMgr.ins.showModule(11300,2);
            }
         }
         else
         {
            ModuleMgr.ins.showModule(11300,0);
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         if(FuncOpenAutoCtrl.checkOpen(30815) || EnvConfig.ins.showDevModule)
         {
            this.box_hero.visible = true;
         }
         else
         {
            this.box_hero.visible = false;
         }
         setRedPoint();
         this.panelBg.titleImgId = this.moduleId;
         this.onTabBarChanged(0);
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         this.preShowCpl();
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         NGUtil.checkModuleShow(this.moduleId,this);
      }
      
      private function setRedPoint() : void
      {
         this.img_heroRedPoint.visible = HeroModel.ins.haveTupoHeros() || RoleLevelUpUtil.chekHasNeedPromptLevelUpHero() || HeroModel.ins.haveCanAwakeHeros() || HeroModel.ins.haveCanPhaseUpTalent();
         this.img_clipRedPoint.visible = BagModel.ins.heroPiecesCanActive();
         CheckRoleTeamRedPointCtrl.ins.checkAndSwitchHeroShowRedPoi();
         if(HeroModel.ins.newHeroArr.length > 0)
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_NEW",new SwitchModuleNewMsg(30701,true));
         }
         else
         {
            ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_NEW",new SwitchModuleNewMsg(30701,false));
         }
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            this.addEventListener("evtNewHero",newHeroHandler);
            this.addEventListener("evtClickNewHero",clickNewHeroHandler);
         }
         else
         {
            this.removeEventListener("evtNewHero",newHeroHandler);
            this.removeEventListener("evtClickNewHero",clickNewHeroHandler);
         }
      }
      
      private function refreshRedPoint() : void
      {
         this.img_heroRedPoint.visible = HeroModel.ins.haveTupoHeros() || RoleLevelUpUtil.chekHasNeedPromptLevelUpHero() || HeroModel.ins.haveCanAwakeHeros() || HeroModel.ins.haveCanPhaseUpTalent();
      }
      
      private function onTabBarChanged(param1:int) : void
      {
         switch(int(param1))
         {
            case 0:
               recycleBox.visible = true;
               rebornBox.visible = true;
               break;
            case 1:
               recycleBox.visible = false;
               rebornBox.visible = false;
         }
         this.list_items.repeatY = _repeatYArr[param1];
         this.list_items.itemRender = _renderArr[param1];
         this.list_items.page = 0;
         this.list_items.dataSource = getDatasource(param1);
         this.list_items.commitMeasure();
         this.pageBarS2.bindList(this.list_items);
         if(this.moduleInfo.phase == 15)
         {
            NGUtil.checkModuleShow(this.moduleId,this);
         }
      }
      
      private function newHeroHandler(param1:Event) : void
      {
         if(NGUtil.checkModuleShow(this.moduleId,this) == false)
         {
            NGUtil.checkOtherModuleShow();
         }
         this.img_heroRedPoint.visible = true;
         var _loc3_:HeroPieceRender = param1.target as HeroPieceRender;
         var _loc2_:Image = new Image(_loc3_.img_icon.skin);
         _loc2_.width = _loc3_.img_icon.width;
         _loc2_.height = _loc3_.img_icon.height;
         new IconFlyEff(_loc2_,ModuleMgr.ins.toGlobalPoi(_loc3_.img_icon),ModuleMgr.ins.toGlobalPoi(this.tabBar.items[0]).add(new Point((this.tabBar.items[0] as Button).width / 2))).set_scaleTo().addHandlers(flyCplHandler).exec();
         new ListCellTweenEffect(this.list_items,getDatasource(this.tabBar.selectedIndex)).set_compareDataHandler(compareDataHandler).exec();
         setRedPoint();
      }
      
      private function flyCplHandler() : void
      {
         ArriveTickEff.createIns(this.tabBar.items[0] as DisplayObject).start();
      }
      
      private function compareDataHandler(param1:WealthVo) : String
      {
         return Uint64Util.toString(param1.item.id);
      }
      
      private function clickNewHeroHandler(param1:Event) : void
      {
         setRedPoint();
      }
      
      private function getDatasource(param1:int) : Array
      {
         var _loc3_:* = null;
         var _loc2_:* = [];
         switch(int(param1))
         {
            case 0:
               _loc2_ = HeroModel.ins.getSortOnHeroList();
               break;
            case 1:
               _loc3_ = BagModel.ins.getHeroPiecesArr();
               _loc3_ = BagModel.ins.countWealthVoSortTempProp(_loc3_);
               _loc3_.sort(sortHeroPieceFun);
               _loc2_ = _loc3_;
         }
         return _loc2_;
      }
      
      private function sortHeroPieceFun(param1:WealthVo, param2:WealthVo) : int
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:StcItemVo = param1.stcItemVo;
         var _loc8_:StcItemVo = param2.stcItemVo;
         var _loc4_:int = param1.extraData["HERO_PIECE_STATE"];
         var _loc3_:int = param2.extraData["HERO_PIECE_STATE"];
         if(_loc4_ == 0 && _loc3_ == 0)
         {
            return sortHeroPieceFunSub(param1,param2,_loc7_,_loc8_);
         }
         _loc5_ = param1.extraData["HERO_POSITION"];
         _loc6_ = param2.extraData["HERO_POSITION"];
         if(_loc4_ == _loc3_)
         {
            if(_loc5_ < _loc6_)
            {
               return -1;
            }
            return 1;
         }
         if(_loc4_ > _loc3_)
         {
            return -1;
         }
         return 1;
      }
      
      private function sortHeroPieceFunSub(param1:WealthVo, param2:WealthVo, param3:StcItemVo, param4:StcItemVo) : int
      {
         var _loc8_:StcNpcVo = StcMgr.ins.getNpcVo(param3.heroPiece_stcNpcId);
         var _loc7_:StcNpcVo = StcMgr.ins.getNpcVo(param4.heroPiece_stcNpcId);
         var _loc6_:* = param1.item.count >= param3.heroPieceNeed;
         var _loc5_:* = param2.item.count >= param4.heroPieceNeed;
         if(_loc6_ && _loc5_ == false)
         {
            return -1;
         }
         if(_loc6_ == false && _loc5_)
         {
            return 1;
         }
         if(_loc8_.quality > _loc7_.quality)
         {
            return -1;
         }
         if(_loc8_.quality < _loc7_.quality)
         {
            return 1;
         }
         if(param1.item.count > param2.item.count)
         {
            return -1;
         }
         if(param1.item.count < param2.item.count)
         {
            return 1;
         }
         if(param3.id > param4.id)
         {
            return -1;
         }
         if(param3.id < param4.id)
         {
            return 1;
         }
         return 0;
      }
      
      public function get pageBarS2() : PageBarS2
      {
         return this.pageBar as PageBarS2;
      }
      
      override public function dispose() : void
      {
         HeroModel.ins.newHeroArr.length = 0;
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_NEW",new SwitchModuleNewMsg(30701,false));
         CheckRoleTeamRedPointCtrl.ins.checkAndSwitchHeroShowRedPoi();
         NewerAlertModel.ins.checkCanTupo();
         super.dispose();
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(!(int(param2.checkId) - 10062))
         {
            if(this.tabBar.selectedIndex == 1)
            {
               _loc5_ = param2.checkParams[0];
               _loc6_ = this.list_items.cells.length;
               _loc7_ = 0;
               while(_loc7_ < _loc6_)
               {
                  _loc3_ = this.list_items.cells[_loc7_] as HeroPieceRender;
                  _loc4_ = _loc3_.wealthVo;
                  if(_loc4_)
                  {
                     if(_loc4_.sid == _loc5_)
                     {
                        return _loc3_;
                     }
                     _loc7_++;
                     continue;
                  }
                  break;
               }
            }
         }
         return NGUtil.getCompById(this,param1,param2);
      }
      
      public function ngCheck(param1:int, param2:Array, param3:StcGuideVo) : int
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!(int(param1) - 10062))
         {
            if(this.tabBar.selectedIndex == 1)
            {
               _loc6_ = param2[0];
               _loc7_ = this.list_items.cells.length;
               _loc8_ = 0;
               while(_loc8_ < _loc7_)
               {
                  _loc4_ = this.list_items.cells[_loc8_] as HeroPieceRender;
                  _loc5_ = _loc4_.wealthVo;
                  if(_loc5_)
                  {
                     if(_loc5_.sid == _loc6_ && _loc5_.showCount >= _loc5_.stcItemVo.heroPieceNeed)
                     {
                        return 1;
                     }
                     _loc8_++;
                     continue;
                  }
                  break;
               }
               return 0;
            }
         }
         return 1;
      }
   }
}
