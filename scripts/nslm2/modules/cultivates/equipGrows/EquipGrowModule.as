package nslm2.modules.cultivates.equipGrows
{
   import game.ui.equipGrows.EquipGrowPanelUI;
   import nslm2.modules.footstones.newerGuideModules.INewerGuideGetComp;
   import com.mz.core.interFace.ILogger;
   import com.mz.core.logging.Log;
   import morn.core.components.ViewStack;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.scenes.commons.UIWeapon3D;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.netease.protobuf.UInt64;
   import nslm2.modules.roleInfos.equipPanels.RoleSelectEquipPanel;
   import morn.core.components.Component;
   import proto.HeroInfo;
   import morn.core.components.List;
   import nslm2.modules.roleInfos.RoleInfoModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.roleInfos.equipPanels.HeroEquipVo;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
   import nslm2.common.ui.components.comp3ds.lightAndShadows.LightAndShadowCtrl3;
   import nslm2.modules.cultivates.roleTeam.model.RoleTeamModel;
   import nslm2.common.ui.components.debug3d.DebugWeaponBox;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.recycle.view.render.RecycleAlertRender;
   import proto.HeroInfoNotify;
   import com.greensock.TweenLite;
   import proto.Item;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.HeroModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.mgrs.stcMgrs.vos.StcEquipLiansuoVo;
   import game.ui.roleInfos.NpcPropVo;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.cultivates.equipGrows.commons.IEquipGrowSubPanel;
   import morn.core.components.VBox;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import nslm2.common.consts.NPCPropConsts;
   import flash.display.BitmapData;
   import morn.core.events.UIEvent;
   import nslm2.common.vo.WealthVo;
   import flash.geom.Vector3D;
   import com.greensock.easing.Cubic;
   import proto.EquipPanelViewRes;
   import flash.display.DisplayObjectContainer;
   import nslm2.modules.bag.itemModuels.BagModel;
   import proto.ItemReduce;
   import nslm2.modules.footstones.quickUseModules.QuickUseModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.mgrs.stcMgrs.vos.StcGuideVo;
   import nslm2.modules.cultivates.equipGrows.strens.EquipStrenPanel;
   import nslm2.modules.cultivates.equipGrows.jinglians.EquipJinglianPanel;
   import nslm2.modules.cultivates.equipGrows.upStars.EquipUpStarPanel;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   
   public class EquipGrowModule extends EquipGrowPanelUI implements INewerGuideGetComp
   {
      
      private static var logger:ILogger = Log.getClassLogger(EquipGrowModule);
      
      private static const NG_COMP_NAME:String = "list_equip_3";
       
      
      private var model:nslm2.modules.cultivates.equipGrows.EquipGrowModel;
      
      public var subViewStack:ViewStack;
      
      private var panel3D:UIPanel3D;
      
      private var weapon3d:UIWeapon3D;
      
      private var wareEquipEffect:BmcSpriteSheet;
      
      private var crtWeaonID:int;
      
      private var lineEff:BmcSpriteSheet;
      
      private var starsEff:BmcSpriteSheet;
      
      private var activateEff:BmcSpriteSheet;
      
      private var selectHeroID:UInt64;
      
      private var selectEquipPos:int;
      
      public var equipSelect:RoleSelectEquipPanel;
      
      private var equipSelectRender:Component;
      
      private var bgSkinArr:Array;
      
      public var debugWeaponBox:DebugWeaponBox;
      
      private var equipModel2D:BmcSpriteSheet;
      
      public function EquipGrowModule()
      {
         bgSkinArr = ["jpg.uiEquipGrow.new.img_funBgStr","jpg.uiEquipGrow.new.img_funBgStr","jpg.uiEquipGrow.new.img_funBgStr"];
         super();
         model = nslm2.modules.cultivates.equipGrows.EquipGrowModel.ins;
         subViewStack = new ViewStack();
         subViewStack.subViewClasses = [EquipStrenPanel,EquipJinglianPanel,EquipUpStarPanel];
         tabBar.selectHandler = onTabBarSelected;
         equipSelector.addEventListener("accordion_change_sub_selected_data",selectEquipHandler);
         equipSelector.selectHandler = changeSelectedHero;
         ServerEngine.ins.addAlwayHandler(5011,refreshPlayerData);
         BmcSpriteSheet.preload(new <int>[5003,5004,5005,1060]);
         var _loc2_:Array = [LocaleMgr.ins.getStr(10220007)];
         var _loc1_:Array = [30500];
         if(FuncOpenAutoCtrl.checkOpen(30501))
         {
            _loc2_.push(LocaleMgr.ins.getStr(30100081));
            _loc1_.push(30501);
         }
         if(FuncOpenAutoCtrl.checkOpen(30502))
         {
            _loc2_.push(LocaleMgr.ins.getStr(999000043));
            _loc1_.push(30502);
         }
         tabBar.labels = _loc2_.join(",");
         FuncOpenAutoCtrl.checkFuncTabNew(_loc1_,tabBar);
      }
      
      private function changeBg(param1:int) : void
      {
         var _loc2_:String = bgSkinArr[param1];
         if(img_funBg.skin != _loc2_)
         {
            img_funBg.skin = _loc2_;
            this.panel3D.changeBgImg(App.asset.getBitmapData(_loc2_));
         }
      }
      
      private function changeSelectedHero() : void
      {
         var _loc2_:int = equipSelector.selectedIndex;
         var _loc1_:int = model.getDefaultSelectedEquipIndex(_loc2_);
         if(_loc1_ >= 0)
         {
            model.heroInfo = equipSelector.selectedItem as HeroInfo;
            model.item = model.defaultSelectItem;
            (equipSelector.subSelection as List).selectedIndex = _loc1_;
            RoleInfoModel.ins.heroInfo = model.heroInfo;
            refreshSelctetedPanel();
         }
         ObserverMgr.ins.sendNotice("msg_role_select_changed",equipSelector.selectedItem as HeroInfo);
      }
      
      private function showSelectEquipPanel(param1:Component, param2:HeroEquipVo, param3:int = 1) : void
      {
         var _loc4_:* = null;
         if(!model.heroInfo)
         {
            return;
         }
         if(equipSelectRender == param1 && equipSelect)
         {
            disposeEquipSelectPanel();
         }
         else
         {
            disposeEquipSelectPanel();
            equipSelectRender = param1;
            _loc4_ = DisplayUtils.localToTarget(param1,this);
            _loc4_.x = _loc4_.x + param1.width / 2;
            equipSelect = new RoleSelectEquipPanel();
            this.equipSelect.addEventListener("close",disposeEquipSelectPanel);
            if(param3 == 1)
            {
               equipSelect.panelBg.titleImgId = 30101;
            }
            else
            {
               equipSelect.panelBg.titleImgId = 30102;
            }
            this.addChild(equipSelect);
            this.equipSelect.x = _loc4_.x - this.equipSelect.width / 2 + 30 - 41;
            if(localToGlobal(_loc4_).y + 60 + this.equipSelect.height > stage.stageHeight - EnvConfig.ins.shellY)
            {
               this.equipSelect.y = _loc4_.y - 1 - this.equipSelect.height;
            }
            else
            {
               this.equipSelect.y = _loc4_.y + 60;
            }
            model.crtSwapEquip = param2.wealthVo.item;
            if(model.heroInfo)
            {
               this.equipSelect.show(new EquipHeroPosVo(model.heroInfo.baseInfo.id,param2.place,param2.wealthVo != null),param1);
            }
         }
      }
      
      private function disposeEquipSelectPanel(... rest) : void
      {
         if(this.equipSelect != null)
         {
            this.equipSelect.removeEventListener("close",disposeEquipSelectPanel);
            this.equipSelect.panelFadeOutAndDispose();
            this.equipSelect = null;
         }
         equipSelectRender = null;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:int = 0;
         if(param1)
         {
            selectHeroID = param1["heroId"];
            selectEquipPos = param1["pos"];
            _loc2_ = param1["tabIndex"];
         }
         this.panelBg.titleImgId = this.moduleId;
         panel3D = new UIPanel3D(this);
         panel3D.antiAlias = 4;
         panel3D.lightCtrl = new LightAndShadowCtrl3(panel3D.layer3D);
         DisplayUtils.addChildAbove(panel3D,this.img_funBg);
         panel3D.initByImage(img_funBg,this.panelBg);
         changeBg(_loc2_);
         panel3D.visible = false;
         subViewStack.x = 232;
         subViewStack.y = 74;
         this.addChild(subViewStack);
         this.visible = false;
         tabBar.selectedIndex = _loc2_;
         subViewStack.selectedIndex = _loc2_;
         subViewStack.alpha = 0;
         server_cpl();
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         RoleTeamModel.ins.blockFloatMsg = true;
         this.render_recycle.dataSource = 30500;
         super.preShow(param1);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         RoleTeamModel.ins.blockFloatMsg = false;
         super.preClose(param1);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         panel3D.visible = true;
         NGUtil.checkModuleShow(30500,this);
         PlayerModel.ins.autoUpdateHeroInfo = false;
         (this.render_recycle as RecycleAlertRender).autoHide();
      }
      
      override public function getFocusNotices() : Array
      {
         return ["MSG_GM_CMD","equip_show_selecte_equip_panel","equip_wear_equip","notice_refresh_module_equip_grow_data","REFRESH_WEAPON_3D"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("REFRESH_WEAPON_3D" !== _loc4_)
         {
            if("MSG_GM_CMD" !== _loc4_)
            {
               if("equip_show_selecte_equip_panel" !== _loc4_)
               {
                  if("equip_wear_equip" !== _loc4_)
                  {
                     if("notice_refresh_module_equip_grow_data" === _loc4_)
                     {
                        if(param2)
                        {
                           selectHeroID = param2["heroId"];
                           selectEquipPos = param2["pos"];
                           _loc3_ = 0;
                           _loc3_ = param2["tabIndex"];
                           tabBar.selectedIndex = _loc3_;
                           selecteDefault();
                           refreshSelctetedPanel();
                        }
                     }
                  }
                  else
                  {
                     wearEquipHander(param2[0],param2[1]);
                  }
               }
               else
               {
                  showSelectEquipPanel(param2[0],param2[1]);
               }
            }
            else if(param2 == "debug3d")
            {
               if(debugWeaponBox == null)
               {
                  debugWeaponBox = new DebugWeaponBox(this.panel3D);
                  debugWeaponBox.bindWeapon(weapon3d);
               }
            }
         }
         else
         {
            refreshWeapon3D();
         }
      }
      
      private function refreshPlayerData(param1:HeroInfoNotify) : void
      {
         if(model.heroInfo && model.heroInfo.baseInfo)
         {
            if(model.heroInfo.baseInfo.strengthLSlv < param1.info.baseInfo.strengthLSlv)
            {
               TweenLite.delayedCall(0.8,liansuoLevelUpHandler,[1,param1.info]);
            }
            if(model.heroInfo.baseInfo.jinglianLSLv < param1.info.baseInfo.jinglianLSLv)
            {
               TweenLite.delayedCall(0.8,liansuoLevelUpHandler,[2,param1.info]);
            }
         }
         if(false && EnvConfig.ins.showDebugModule)
         {
            liansuoLevelUpHandler(2,param1.info);
         }
         if(model.item)
         {
            var _loc4_:int = 0;
            var _loc3_:* = param1.info.items;
            for each(var _loc2_ in param1.info.items)
            {
               if(Uint64Util.equal(_loc2_.id,model.item.id))
               {
                  model.item = _loc2_;
               }
            }
         }
         HeroModel.ins.onChangeOne(param1.info);
         model.heroInfo = param1.info;
         RoleInfoModel.ins.heroInfo = model.heroInfo;
         model.updateHeroInfo(param1.info);
         equipSelector.dataSource = model.heroInfoArr;
         model.initAllEquipList();
         updateEquipList();
         updateEquipName();
      }
      
      private function updateEquipName() : void
      {
         var _loc5_:* = null;
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         if(model.item)
         {
            _loc5_ = StcMgr.ins.getItemVo(model.item.itemId);
            txt_equipName.color = ColorLib.qualityColor(_loc5_.quality);
            txt_equipName.text = LocaleMgr.ins.getStr(_loc5_.name);
            _loc2_ = model.item.strengthId;
            _loc1_ = model.item.jinglianId;
            if(_loc2_ > 0)
            {
               _loc4_ = StcMgr.ins.getEquipStrengthVo(_loc2_).level;
            }
            if(_loc1_ > 0)
            {
               _loc3_ = StcMgr.ins.getEquipJinglianVo(_loc1_).level;
            }
            if(model.crtPanelID == 0)
            {
               txt_equipName.appendText(" +" + _loc4_);
            }
            else
            {
               txt_equipName.appendText(" " + LocaleMgr.ins.getStr(999000044,[_loc3_]));
            }
         }
         else
         {
            txt_equipName.text = "";
         }
      }
      
      override protected function moduleFadeInCpl() : void
      {
         super.moduleFadeInCpl();
      }
      
      private function liansuoLevelUpHandler(param1:int, param2:HeroInfo) : void
      {
         var _loc5_:int = 0;
         var _loc4_:* = null;
         var _loc8_:* = null;
         if(!lineEff)
         {
            lineEff = new BmcSpriteSheet();
            lineEff.init(5003);
            lineEff.x = 278;
            lineEff.y = 220;
            addChild(lineEff);
         }
         if(param1 == 1)
         {
            _loc5_ = param2.baseInfo.strengthLSlv;
            _loc4_ = LocaleMgr.ins.getStr(30500011,[TextFieldUtil.htmlText(_loc5_,new TextFormat(null,null,458496))]);
         }
         else
         {
            _loc5_ = param2.baseInfo.jinglianLSLv;
            _loc4_ = LocaleMgr.ins.getStr(30500017,[TextFieldUtil.htmlText(_loc5_,new TextFormat(null,null,458496))]);
         }
         _loc8_ = StcMgr.ins.getVoByMultiColumnValue("static_equip_liansuo",["kind","level"],[param1,_loc5_]);
         if(!_loc8_)
         {
            return;
         }
         var _loc3_:Array = NpcPropVo.parseArrStr(_loc8_.add_growth);
         var _loc6_:Bitmap = getTipBmp(_loc4_,_loc3_);
         var _loc7_:Sprite = new Sprite();
         _loc7_.addChild(_loc6_);
         _loc6_.x = -_loc6_.width >> 1;
         _loc6_.y = -_loc6_.height >> 1;
         _loc7_.x = 504;
         _loc7_.y = 245 + _loc7_.height / 2;
         addChild(_loc7_);
         TweenLite.from(_loc7_,0.2,{"alpha":0});
         TweenLite.to(_loc7_,0.3,{
            "delay":1,
            "scaleX":2,
            "scaleY":2,
            "alpha":0,
            "y":_loc7_.y - 30,
            "onComplete":tweenComplete,
            "onCompleteParams":[_loc7_,_loc6_]
         });
         TweenLite.delayedCall(1,playeStarsMoveEff);
         TweenLite.delayedCall(1.5,playActivateEff);
         TweenLite.delayedCall(1.8,updateLianSuoLvl,[_loc5_]);
      }
      
      private function playActivateEff() : void
      {
         activateEff = new BmcSpriteSheet();
         activateEff.init(5005);
         activateEff.x = 177;
         activateEff.y = 8;
         addChild(activateEff);
      }
      
      private function playeStarsMoveEff() : void
      {
         starsEff = new BmcSpriteSheet();
         starsEff.init(5004);
         starsEff.x = 268;
         starsEff.y = 105;
         addChild(starsEff);
      }
      
      private function tweenComplete(param1:Sprite, param2:Bitmap) : void
      {
         if(!param2)
         {
            param2.bitmapData.dispose();
            param2 = null;
         }
         DisplayUtils.removeSelf(param1);
      }
      
      private function getTipBmp(param1:String, param2:Array) : Bitmap
      {
         var _loc5_:* = null;
         AlertUtil.float(param1,DisplayUtils.globarCenter(this.subViewStack).add(new Point(0,-50)),-1,null,DisplayUtils.globarCenter((subViewStack.selection as IEquipGrowSubPanel).liansuoTxt),1);
         var _loc7_:VBox = new VBox();
         _loc7_.space = 4;
         _loc7_.align = "center";
         var _loc6_:Label = new Label();
         _loc6_.isHtml = true;
         _loc6_.color = 16777215;
         _loc6_.stroke = "0x0";
         _loc6_.labelFilterKind = "黑色1像素描边";
         _loc6_.size = 24;
         _loc6_.text = param1;
         _loc7_.addChild(_loc6_);
         var _loc9_:Box = new Box();
         _loc9_.height = 8;
         _loc7_.addChild(_loc9_);
         var _loc11_:int = 0;
         var _loc10_:* = param2;
         for each(var _loc8_ in param2)
         {
            _loc5_ = new Label();
            _loc5_.size = 16;
            _loc5_.color = 3997440;
            _loc5_.labelFilterKind = "黑色1像素描边";
            _loc5_.text = NPCPropConsts.ins.getLocaleName(_loc8_.propId) + " +" + _loc8_.value;
            _loc7_.addChild(_loc5_);
            AlertUtil.showPropChangeTip(NPCPropConsts.ins.getLocaleNameNormal(_loc8_.propId),_loc8_.value,null,DisplayUtils.globarCenter((subViewStack.selection as IEquipGrowSubPanel).liansuoTxt),DisplayUtils.globarCenter(this.subViewStack).add(new Point(0,-50)));
         }
         var _loc3_:BitmapData = new BitmapData(_loc7_.width,_loc7_.height,true,0);
         var _loc4_:Bitmap = new Bitmap(_loc3_);
         return _loc4_;
      }
      
      private function updateLianSuoLvl(param1:int) : void
      {
         var _loc2_:* = null;
         _loc2_ = subViewStack.selection as IEquipGrowSubPanel;
         if(_loc2_)
         {
            _loc2_.updateLiansuoLvl();
         }
      }
      
      private function selecteHero() : void
      {
         if(!equipSelector.selectedItem)
         {
         }
      }
      
      protected function selectEquipHandler(param1:UIEvent) : void
      {
         var _loc2_:WealthVo = (param1.data as HeroEquipVo).wealthVo;
         if(model.item != _loc2_.item)
         {
            model.item = _loc2_.item;
            model.heroInfo = equipSelector.selectedItem as HeroInfo;
            RoleInfoModel.ins.heroInfo = model.heroInfo;
            var _loc5_:int = 0;
            var _loc4_:* = equipSelector.subCells;
            for each(var _loc3_ in equipSelector.subCells)
            {
               if(equipSelector.subSelection != _loc3_)
               {
                  _loc3_.selectedIndex = -1;
               }
            }
            refreshSelctetedPanel();
         }
      }
      
      private function changeEquipModel2D(param1:int = 2103) : void
      {
         if(crtWeaonID != param1)
         {
            crtWeaonID = param1;
            if(equipModel2D)
            {
               equipModel2D.dispose();
            }
            equipModel2D = new BmcSpriteSheet();
            equipModel2D.y = 136;
            equipModel2D.init(9000000 + param1,1,"all",true);
            addChild(equipModel2D);
         }
         equipModel2D.x = 160;
         equipModel2D.alpha = 0;
         TweenLite.killTweensOf(equipModel2D);
         TweenLite.to(equipModel2D,0.4,{
            "x":400,
            "alpha":1
         });
      }
      
      private function changeEquipModel(param1:int, param2:int, param3:String) : void
      {
         if(crtWeaonID != param1)
         {
            crtWeaonID = param1;
            if(weapon3d != null)
            {
               disposeWeapon(weapon3d);
            }
            weapon3d = new UIWeapon3D();
            switch(int(param2) - 1)
            {
               case 0:
                  weapon3d.position = new Vector3D(-119,-84,0);
                  weapon3d.eulers = new Vector3D(0,0,-36);
                  weapon3d.scaleAll = 1.81;
                  break;
               case 1:
                  weapon3d.position = new Vector3D(0,-80,0);
                  weapon3d.eulers = new Vector3D(0,0,0);
                  weapon3d.scaleAll = 1.75;
                  break;
               case 2:
                  weapon3d.position = new Vector3D(0,-39,0);
                  weapon3d.eulers = new Vector3D(0,0,0);
                  weapon3d.scaleAll = 2.82;
                  break;
               case 3:
                  weapon3d.position = new Vector3D(0,0,0);
                  weapon3d.eulers = new Vector3D(0,0,0);
                  weapon3d.scaleAll = 2;
            }
            weapon3d.initByModelId(param1);
            if(this.debugWeaponBox)
            {
               debugWeaponBox.bindWeapon(weapon3d);
            }
            panel3D.addChild3D(weapon3d);
            TweenLite.from(weapon3d,0.6,{
               "x":-500,
               "ease":Cubic.easeOut
            });
         }
         else if(weapon3d.effIds != param3)
         {
            weapon3d.changeEff(param3);
         }
      }
      
      private function disposeWeapon(param1:UIWeapon3D) : void
      {
         TweenLite.killTweensOf(param1);
         param1.dispose();
      }
      
      private function onTabBarSelected(param1:int) : void
      {
         subViewStack.selectedIndex = param1;
         model.crtPanelID = param1;
         refreshSelctetedPanel();
         updateEquipList();
         changeBg(param1);
         switch(int(param1))
         {
            case 0:
               this.render_recycle.dataSource = 30500;
               (this.render_recycle as RecycleAlertRender).autoHide();
               break;
            case 1:
               this.render_recycle.dataSource = 30501;
               (this.render_recycle as RecycleAlertRender).autoHide();
         }
      }
      
      private function updateEquipList() : void
      {
         if(model.allEquipArr)
         {
            equipSelector.subArray = model.allEquipArr;
         }
      }
      
      private function refreshSelctetedPanel() : void
      {
         var _loc1_:* = null;
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         _loc1_ = subViewStack.selection as IEquipGrowSubPanel;
         if(model.item)
         {
            subViewStack.visible = true;
            if(equipModel2D)
            {
               equipModel2D.visible = true;
            }
            updateEquipName();
         }
         else
         {
            subViewStack.visible = false;
            if(equipModel2D)
            {
               equipModel2D.visible = false;
            }
            txt_equipName.text = "";
         }
         refreshWeapon3D();
         if(_loc1_)
         {
            _loc1_.show();
            _loc1_.weaoponRef = this.weapon3d;
            _loc1_.updateLiansuoLvl();
         }
      }
      
      private function refreshWeapon3D() : void
      {
         var _loc1_:* = null;
         if(model.item)
         {
            _loc1_ = StcMgr.ins.getItemVo(model.item.itemId);
            changeEquipModel(_loc1_.show_id,_loc1_.kind,UIWeapon3D.getEffId(_loc1_,model.item.star).toString());
         }
         else if(weapon3d != null)
         {
            this.crtWeaonID = -1;
            disposeWeapon(weapon3d);
         }
      }
      
      private function server_cpl(param1:EquipPanelViewRes = null) : void
      {
         model.heroInfoArr = HeroModel.ins.teamHeroInfoArr;
         model.initAllEquipList();
         equipSelector.dataSource = model.heroInfoArr;
         equipSelector.subArray = model.allEquipArr;
         selecteDefault();
         refreshSelctetedPanel();
      }
      
      private function selecteDefault() : void
      {
         var _loc1_:int = model.getDefaultSelectedHeroIndex(selectHeroID);
         equipSelector.selectedIndex = _loc1_ < 0?0:_loc1_;
         (equipSelector.subSelection as List).selectedIndex = model.getDefaultSelectedEquipIndex(_loc1_,selectEquipPos);
         model.heroInfo = model.defaultSelectHero;
         model.item = model.defaultSelectItem;
         RoleInfoModel.ins.heroInfo = model.heroInfo;
      }
      
      private function wearEquipHander(param1:DisplayObjectContainer, param2:Item) : void
      {
         var _loc3_:* = null;
         wareEquipEffect = new BmcSpriteSheet();
         var _loc4_:Point = DisplayUtils.localToTarget(param1,this,new Point(0,0));
         wareEquipEffect.x = _loc4_.x - 41;
         wareEquipEffect.y = _loc4_.y - 38;
         this.addChild(wareEquipEffect);
         wareEquipEffect.init(1060);
         if(model.crtSwapEquip)
         {
            model.crtSwapEquip.isEquiped = false;
            BagModel.ins.add([model.crtSwapEquip]);
         }
         if(param2)
         {
            _loc3_ = new ItemReduce();
            _loc3_.id = param2.id;
            _loc3_.count = 1;
            QuickUseModel.ins.removeQuickUseById(param2.id);
            BagModel.ins.reduce([_loc3_]);
         }
         model.item = param2;
         model.crtSwapEquip = null;
         refreshSelctetedPanel();
      }
      
      private function get equipList() : List
      {
         return equipSelector.subSelection as List;
      }
      
      override public function fadeOut() : void
      {
         this.panel3D.dispose();
         super.fadeOut();
      }
      
      override protected function moduleFadeInTypeCpl() : void
      {
         if(this.canRun == false)
         {
            return;
         }
         TweenLite.to(subViewStack,0.3,{"alpha":1});
         super.moduleFadeInTypeCpl();
      }
      
      override public function dispose() : void
      {
         if(debugWeaponBox)
         {
            debugWeaponBox.dispose();
            debugWeaponBox = null;
         }
         ObserverMgr.ins.sendNotice("SIMPLE_STR_MSG_FLOAT_MSG_STOP");
         model.dispose();
         model = null;
         if(weapon3d)
         {
            weapon3d.dispose();
            weapon3d = null;
         }
         if(equipModel2D)
         {
            equipModel2D.dispose();
         }
         TweenLite.killDelayedCallsTo(playeStarsMoveEff);
         TweenLite.killDelayedCallsTo(playActivateEff);
         TweenLite.killDelayedCallsTo(liansuoLevelUpHandler);
         TweenLite.killDelayedCallsTo(updateLianSuoLvl);
         ServerEngine.ins.removeAlwayHandler(5011,refreshPlayerData);
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         PlayerModel.ins.autoUpdateHeroInfo = true;
         super.dispose();
      }
      
      public function getCompById(param1:String, param2:StcGuideVo) : Component
      {
         if(param1 == "list_equip_3")
         {
            return (this.equipSelector.subCells[0] as List).getCell(2);
         }
         return NGUtil.getCompById(this,param1,param2);
      }
   }
}
