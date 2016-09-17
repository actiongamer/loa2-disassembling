package nslm2.modules.scenes.commons
{
   import org.specter3d.display.Specter3D;
   import com.game.shared.component.NameTag3D;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import away3d.containers.ObjectContainer3DIgnoreTransform;
   import morn.core.managers.timerMgrs.TimerManager;
   import flash.events.Event;
   import nslm2.common.vo.VipInfoVo;
   import com.mz.core.configs.EnvConfig;
   import com.mz.core.mgrs.resMgrs.ResMgr;
   import nslm2.mgrs.skins.SkinLib;
   import com.mz.core.mgrs.res3ds.BitmapDataFor3D;
   import away3d.entities.Entity;
   import morn.core.utils.StringUtils;
   import morn.core.components.Label;
   import com.mz.core.configs.ClientConfig;
   import flash.display.BitmapData;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.ColorUtil;
   import morn.core.components.ProgressBar;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.core.components.Image;
   import nslm2.mgrs.stcMgrs.vos.Stc2dSpecialEffectVo;
   import nslm2.mgrs.stcMgrs.vos.StcTitleVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.cultivates.militaryInfos.MilitaryConsts;
   import com.mz.core.mgrs.resMgrs.GetResTask;
   import nslm2.common.ui.components.comp3ds.Effect3D;
   import com.spriteSheet.SpriteSheetData;
   import com.mz.core.logging.Log;
   import flash.geom.Rectangle;
   import flash.geom.Point;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcCarrerVo;
   import nslm2.modules.footstones.tooltipsModules.ToolTipNpcGroupVo;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import org.specter3d.configs.Specter3DConfig;
   
   public class Unit3DTagBox extends Specter3D
   {
       
      
      public var _nameTag3D:NameTag3D;
      
      public var vipTag:Image3D;
      
      public var _imgGroup3D:NameTag3D;
      
      public var _guildNameTag3D:NameTag3D;
      
      public var _abilityTag3D:NameTag3D;
      
      public var _hpBarImage3D:Image3D;
      
      public var unit3d:nslm2.modules.scenes.commons.Unit3DBase;
      
      public var boxIngoreRoScale:ObjectContainer3DIgnoreTransform;
      
      private var lastFixedInt:int = 0;
      
      private var _fixedY:int = 0;
      
      private var vipInfoVoOld:VipInfoVo;
      
      public var nameTagStr:String;
      
      public var nameTagColor:uint;
      
      public var nameWidth:int;
      
      public var _sdAction:NameTag3D;
      
      private var fightEffect:SpecterEffect;
      
      public var curSideImg:Image3D;
      
      public var curPeakSideImg:Image3D;
      
      public var titleImg1:Image3D;
      
      private var img_title1:Image;
      
      private var titleId1:int;
      
      private var eff:Stc2dSpecialEffectVo;
      
      private var stc:StcTitleVo;
      
      private var _eff3d:Effect3D;
      
      private var ssd:SpriteSheetData;
      
      public var flagImg:Image3D;
      
      private var curCareerId:int;
      
      public var careerImg:Image3D;
      
      private var curGroupId:int;
      
      public var groupImg:Image3D;
      
      public var npcFuncTag:Image3D;
      
      protected var redPoint3d:Image3D;
      
      private var bg:Image3D;
      
      private var nameLabel:Label;
      
      public function Unit3DTagBox(param1:Specter3DConfig = null)
      {
         super(param1);
         boxIngoreRoScale = new ObjectContainer3DIgnoreTransform();
         boxIngoreRoScale.ignoreRotation = true;
         boxIngoreRoScale.ignoreScale = true;
         this.addChild(boxIngoreRoScale);
      }
      
      public function validateTag3DBox() : void
      {
         if(this.isDispose)
         {
            return;
         }
         if(unit3d.avatar == null)
         {
            return;
         }
         unit3d.addEventListener("scaleChanged",on_scale_changed);
         unit3d.box3D2.addEventListener("scaleChanged",on_scale_changed);
         lastFixedInt = 0;
         this.validateTag3DBox_c();
      }
      
      private function onBoundFixed(... rest) : void
      {
         if(lastFixedInt <= TimerManager.ins.currFrame - 30)
         {
            lastFixedInt = TimerManager.ins.currFrame;
         }
      }
      
      private function on_scale_changed(param1:Event) : void
      {
         validateTag3DBox_c();
      }
      
      public function get fixedY() : int
      {
         return _fixedY;
      }
      
      public function set fixedY(param1:int) : void
      {
         if(_fixedY != param1)
         {
            _fixedY = param1;
            if(_fixedY > 0)
            {
               this.y = param1;
            }
         }
      }
      
      protected function validateTag3DBox_c() : void
      {
         var _loc1_:* = null;
         if(fixedY)
         {
            this.y = fixedY;
         }
         else if(unit3d.horseAvatar && unit3d.horseAvatar.avatarMesh)
         {
            this.y = 90 * unit3d.box3D2.scaleAll * unit3d.horseAvatar.scaleAll + 16 + 4;
         }
         else if(unit3d.avatar)
         {
            this.y = unit3d.avatar.headerY * unit3d.box3D2.scaleAll * unit3d.avatar.scaleAll + 16 + 4;
         }
      }
      
      private function set validateY(param1:int) : void
      {
         if(Math.abs(this.y - param1) > 8)
         {
            this.y = param1;
         }
      }
      
      public function initVip(param1:VipInfoVo) : void
      {
         var _loc2_:* = null;
         if(EnvConfig.ins.vipType == 0)
         {
            return;
         }
         if(param1 && param1.curQQVip)
         {
            if(vipInfoVoOld == null || vipInfoVoOld.equal(param1))
            {
               vipInfoVoOld == param1.clone();
               _loc2_ = ResMgr.ins.getResFor3D(SkinLib.vipIconPic(param1.curQQVip,param1.isQQYear,param1.isQQLux));
               if(vipTag == null)
               {
                  vipTag = new Image3D(null,_loc2_.oriW,_loc2_.oriH,0);
                  vipTag.renderLayer = Entity.TOP_LAYER;
                  boxIngoreRoScale.addChild(vipTag);
               }
               else
               {
                  vipTag.visible = true;
               }
               vipTag.showByBmd(_loc2_);
            }
         }
         else if(vipTag != null)
         {
            vipTag.visible = false;
         }
         if(vipTag && vipTag.visible && nameLabel)
         {
            vipTag.x = -nameLabel.textWidth / 2 - vipTag.width / 2 - 4;
         }
      }
      
      public function initName(param1:String, param2:uint, param3:int = 0, param4:VipInfoVo = null) : void
      {
         if(param3 == 0)
         {
            param3 = 12;
         }
         if(StringUtils.isNull(param1))
         {
            return;
         }
         nameTagStr = param1;
         nameTagColor = param2;
         nameLabel = new Label();
         nameLabel.style = "人名1不随品质变化";
         if(ClientConfig.isRuLang())
         {
            nameLabel.font = "Arial";
         }
         nameLabel.color = param2;
         nameLabel.text = param1;
         nameLabel.size = param3;
         var _loc5_:BitmapData = new BitmapData(nameLabel.width,nameLabel.height,true,0);
         nameWidth = nameLabel.width + 20;
         _loc5_.draw(nameLabel,null,null,null,null,true);
         nameLabel.dispose();
         if(_nameTag3D == null)
         {
            _nameTag3D = new NameTag3D();
            this.boxIngoreRoScale.addChild(_nameTag3D);
            _nameTag3D.renderLayer = Entity.TOP_LAYER;
            _nameTag3D.mouseChildren = false;
            _nameTag3D.mouseEnabled = false;
            _nameTag3D.mousePriority = 4;
         }
         _nameTag3D.setBitmapData(_loc5_,true);
         this.initVip(param4);
      }
      
      public function hideGuajiSaoDang() : void
      {
         if(_sdAction)
         {
            this._sdAction.visible = false;
         }
         if(fightEffect)
         {
            fightEffect.dispose();
            removeChild(fightEffect);
            fightEffect = null;
         }
      }
      
      public function showGuajiSaoDang(param1:String, param2:uint) : void
      {
         fightEffect = EffectManager.createEffect(Effect3DUtils.getUrlBySid(6006),true,null);
         fightEffect.y = 50;
         boxIngoreRoScale.addChild(fightEffect);
      }
      
      public function showGuildName(param1:String, param2:String = "[]", param3:uint = 16773888) : void
      {
         if(param2 == "[]")
         {
            param2 = LocaleMgr.ins.getStr(999000565);
         }
         if(_guildNameTag3D == null)
         {
            _guildNameTag3D = new NameTag3D();
            this.boxIngoreRoScale.addChild(_guildNameTag3D);
            _guildNameTag3D.y = 15;
         }
         _guildNameTag3D.setText(param2 + param1,ColorUtil.toHTML(param3));
         _guildNameTag3D.drawBitmap();
      }
      
      public function hideGuildName() : void
      {
         if(_guildNameTag3D)
         {
            this.boxIngoreRoScale.removeChild(_guildNameTag3D);
            _guildNameTag3D.dispose();
            _guildNameTag3D = null;
         }
      }
      
      public function showHpBar(param1:Number, param2:String = null) : void
      {
         var _loc4_:ProgressBar = new ProgressBar();
         _loc4_.skin = !!param2?param2:"png.a5.comps.progresses.progress_S3";
         _loc4_.value = param1;
         _loc4_.commitMeasure();
         var _loc3_:BitmapData = new BitmapData(_loc4_.width,_loc4_.height,true,0);
         _loc3_.draw(_loc4_,null,null,null,null,true);
         if(_hpBarImage3D == null)
         {
            _hpBarImage3D = new Image3D(null,_loc3_.width,_loc3_.height,0);
         }
         boxIngoreRoScale.addChild(_hpBarImage3D);
         _hpBarImage3D.showByBmd(_loc3_);
         _hpBarImage3D.y = 18;
      }
      
      public function hideHpBar() : void
      {
         if(_hpBarImage3D)
         {
            this.boxIngoreRoScale.removeChild(_hpBarImage3D);
            _hpBarImage3D.dispose();
            _hpBarImage3D = null;
         }
      }
      
      public function showBattlefieldSide(param1:int) : void
      {
         this.curSideImg = new Image3D("__no3d/" + UrlLib.battlefieldSideAllFor3D(param1),86,97,0,true,false);
         this.curSideImg.scaleAll = 0.8;
         this.curSideImg.ignoreCameraRotation = true;
         boxIngoreRoScale.addChild(this.curSideImg);
         this.curSideImg.renderLayer = Entity.TOP_LAYER;
         this.curSideImg.mouseEnabled = true;
         this.curSideImg.x = -nameWidth / 2 - 20;
         this.curSideImg.y = 12;
      }
      
      public function hideBattlefieldSide() : void
      {
         if(curSideImg)
         {
            this.boxIngoreRoScale.removeChild(curSideImg);
            curSideImg.dispose();
            curSideImg = null;
         }
      }
      
      public function showPeakSportsSide(param1:int) : void
      {
         curPeakSideImg = new Image3D("__no3d/" + UrlLib.peakSportsSideAllFor3D(param1),86,97,0,true,false);
         curPeakSideImg.scaleAll = 0.8;
         curPeakSideImg.ignoreCameraRotation = true;
         curPeakSideImg.renderLayer = Entity.TOP_LAYER;
         curPeakSideImg.mouseEnabled = true;
         curPeakSideImg.x = -nameWidth / 2 - 20;
         curPeakSideImg.y = 12;
         boxIngoreRoScale.addChild(curPeakSideImg);
      }
      
      public function hidePeakSportsSide() : void
      {
         if(curPeakSideImg)
         {
            this.boxIngoreRoScale.removeChild(curPeakSideImg);
            curPeakSideImg.dispose();
            curPeakSideImg = null;
         }
      }
      
      public function showTitle(param1:int, param2:Boolean = false) : void
      {
         stc = StcMgr.ins.getTitleVo(param1);
         if(ModuleMgr.ins.sceneLayer.curModuleId != 40500)
         {
            if(!param2 && (MilitaryConsts.SHOW_TITLE_KIND_0_SCENE_ARRAY.indexOf(ModuleMgr.ins.sceneLayer.curModuleId) == -1 || stc && stc.platform != 0.toString()))
            {
               return;
            }
         }
         hideTitle();
         hideTitleEff();
         if(SceneModel.ins.isCrossScene)
         {
            if(stc && stc.platform != 0.toString())
            {
               return;
            }
         }
         if(stc)
         {
            if(stc.isEffect > 0)
            {
               eff = StcMgr.ins.get2dSpecialEffectVo(stc.titileicon);
               new GetResTask(34,eff.path + ".ssd",2).addHandlers(getSSD_cpl).exec();
            }
            else
            {
               img_title1 = new Image();
               titleId1 = stc.titileicon;
               var _loc3_:* = UrlLib.getPlayerTitleImg(stc.titileicon);
               img_title1.skin = _loc3_;
               new GetResTask(1,_loc3_).addCompleteHandler(title1Loaded).exec();
            }
         }
      }
      
      public function hideTitleEff() : void
      {
         if(_eff3d)
         {
            boxIngoreRoScale.removeChild(_eff3d);
            _eff3d.dispose();
            _eff3d = null;
         }
      }
      
      public function title1Loaded() : void
      {
         if(this.isDispose)
         {
            return;
         }
         hideTitle();
         this.titleImg1 = new Image3D(UrlLib.getPlayerTitleImg(titleId1,false),0,0,0,false,true);
         this.titleImg1.blendMode = "layer";
         this.titleImg1.ignoreCameraRotation = true;
         boxIngoreRoScale.addChild(this.titleImg1);
         this.titleImg1.renderLayer = Entity.TOP_LAYER;
         this.titleImg1.mouseEnabled = true;
         if(_nameTag3D)
         {
            if(_guildNameTag3D)
            {
               this.titleImg1.y = _guildNameTag3D.y + img_title1.height;
            }
            else
            {
               this.titleImg1.y = _nameTag3D.y + img_title1.height;
            }
         }
         else
         {
            this.titleImg1.x = 10;
         }
      }
      
      private function getSSD_cpl() : void
      {
         var _loc1_:int = 0;
         if(this.isDispose)
         {
            return;
         }
         try
         {
            ssd = ResMgr.ins.getRes(eff.path + ".ssd") as SpriteSheetData;
            if(ssd)
            {
               if(!_eff3d)
               {
                  _eff3d = new Effect3D(eff.path,ssd);
               }
               else
               {
                  boxIngoreRoScale.removeChild(_eff3d);
                  _eff3d = new Effect3D(eff.path,ssd);
               }
               _loc1_ = 0;
               if(_guildNameTag3D)
               {
                  this._eff3d.outY = _guildNameTag3D.y + ssd.oriHeight / 2 + stc.offsetY;
               }
               else if(_nameTag3D)
               {
                  this._eff3d.outY = _nameTag3D.y + ssd.oriHeight / 2 + stc.offsetY;
               }
               else
               {
                  this._eff3d.outY = 10;
                  _loc1_ = 10;
               }
               this._eff3d.outX = stc.offset.split(",")[0] + _loc1_;
               boxIngoreRoScale.addChild(_eff3d);
            }
            return;
         }
         catch($err:Error)
         {
            Log.error(this,$err,$err.getStackTrace());
            return;
         }
      }
      
      public function hideTitle() : void
      {
         if(titleImg1)
         {
            this.boxIngoreRoScale.removeChild(titleImg1);
            titleImg1.dispose();
            titleImg1 = null;
         }
      }
      
      public function showBattlefieldFlag(param1:int) : void
      {
         if(flagImg)
         {
            return;
         }
         this.flagImg = new Image3D("__no3d/" + UrlLib.battlefieldFlagFor3D(param1),96,96,0,true,true);
         this.flagImg.ignoreCameraRotation = true;
         boxIngoreRoScale.addChild(this.flagImg);
         this.flagImg.renderLayer = Entity.TOP_LAYER;
         this.flagImg.mouseEnabled = true;
         this.flagImg.x = nameWidth - 30 - 10;
         this.flagImg.y = 12;
      }
      
      public function hideBattlefieldFlag() : void
      {
         if(flagImg)
         {
            this.boxIngoreRoScale.removeChild(flagImg);
            flagImg.dispose();
            flagImg = null;
         }
      }
      
      private function disposeCareer() : void
      {
         if(careerImg)
         {
            this.boxIngoreRoScale.removeChild(careerImg);
            careerImg.dispose();
            careerImg = null;
         }
      }
      
      public function initCareer(param1:int, param2:int = 180) : void
      {
         disposeCareer();
         curCareerId = param1;
         this.careerImg = new Image3D("__no3d/" + UrlLib.npcTypeImg(param1),30,37,0,true,false);
         boxIngoreRoScale.addChild(this.careerImg);
         this.careerImg.renderLayer = Entity.TOP_LAYER;
         this.careerImg.mouseEnabled = true;
         careerImg.addEventListener("mouseOver3d",imgCareer_over);
         careerImg.addEventListener("mouseOut3d",imgCareer_out);
         careerImg.x = nameWidth / 2 + 15;
         careerImg.y = _nameTag3D.y;
      }
      
      public function initGroup(param1:int) : void
      {
         disposeGroup();
         curGroupId = param1;
         this.groupImg = new Image3D("__no3d/" + UrlLib.npcGroupImg(param1),38,39,0,true,false);
         boxIngoreRoScale.addChild(this.groupImg);
         this.groupImg.renderLayer = Entity.TOP_LAYER;
         this.groupImg.mouseEnabled = true;
         groupImg.addEventListener("mouseOver3d",imgGroup_over);
         groupImg.addEventListener("mouseOut3d",imgGroup_out);
         groupImg.x = -nameWidth / 2 - 20;
         groupImg.y = _nameTag3D.y;
      }
      
      private function validateBmd(param1:BitmapData, param2:int) : BitmapData
      {
         var _loc3_:BitmapData = new BitmapData(Math.abs(param2 + param1.width) * 2,param1.height,true,0);
         _loc3_.copyPixels(param1,new Rectangle(0,0,param1.width,param1.height),new Point(_loc3_.width / 2 + param2));
         return _loc3_;
      }
      
      private function imgCareer_over(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_show",new ToolTipNpcCarrerVo(curCareerId));
      }
      
      private function imgCareer_out(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide",null);
      }
      
      private function imgGroup_over(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_show",new ToolTipNpcGroupVo(curGroupId));
      }
      
      private function imgGroup_out(param1:Event) : void
      {
         ObserverMgr.ins.sendNotice("msg_tooltip_hide",null);
      }
      
      public function clear() : void
      {
         if(unit3d.avatar)
         {
            unit3d.avatar.removeEventListener("bound_fixed",onBoundFixed);
         }
         disposeCareer();
         disposeGroup();
      }
      
      public function disposeName() : void
      {
         if(_nameTag3D)
         {
            this.boxIngoreRoScale.removeChild(_nameTag3D);
            _nameTag3D.dispose();
            _nameTag3D = null;
         }
      }
      
      public function disposeGroup() : void
      {
         if(groupImg)
         {
            this.boxIngoreRoScale.removeChild(groupImg);
            groupImg.dispose();
            groupImg = null;
         }
      }
      
      public function showNpcFuncEff(param1:StcStageNpcRelationVo) : void
      {
         var _loc2_:String = UrlLib.sceneNpcIcon(param1.icon);
         npcFuncTag = new Image3D(_loc2_,90,90,0,true);
         npcFuncTag.blendMode = "layer";
         npcFuncTag.y = 65;
         npcFuncTag.mouseEnabled = true;
         npcFuncTag.renderLayer = Entity.TOP_LAYER;
         npcFuncTag.mousePriority = 4;
         npcFuncTag.ignoreCameraRotation = true;
         boxIngoreRoScale.addChild(npcFuncTag);
      }
      
      public function switchGanTanHao(param1:Boolean) : void
      {
         if(param1 && redPoint3d == null)
         {
            redPoint3d = new Image3D(UrlLib.redPoint3d(),14,14,0,true);
            redPoint3d.renderLayer = Entity.TOP_LAYER;
            redPoint3d.x = 20;
            redPoint3d.y = 96;
            redPoint3d.z = -1;
            redPoint3d.ignoreCameraRotation = true;
            boxIngoreRoScale.addChild(redPoint3d);
         }
         if(redPoint3d)
         {
            redPoint3d.visible = param1;
         }
      }
      
      override public function dispose() : void
      {
         disposeName();
         disposeCareer();
         if(boxIngoreRoScale)
         {
            boxIngoreRoScale.dispose();
            boxIngoreRoScale = null;
         }
         if(unit3d)
         {
            unit3d.addEventListener("scaleChanged",on_scale_changed);
            unit3d.box3D2.addEventListener("scaleChanged",on_scale_changed);
         }
         TimerManager.ins.clearTimer(this.onBoundFixed);
         if(_guildNameTag3D)
         {
            _guildNameTag3D.dispose();
            _guildNameTag3D = null;
         }
         if(npcFuncTag)
         {
            npcFuncTag.dispose();
            npcFuncTag = null;
         }
         if(redPoint3d)
         {
            redPoint3d.dispose();
            redPoint3d = null;
         }
         if(_hpBarImage3D)
         {
            _hpBarImage3D.dispose();
            _hpBarImage3D = null;
         }
         if(nameLabel)
         {
            nameLabel.dispose();
         }
         super.dispose();
      }
      
      public function initBg() : void
      {
         this.bg = new Image3D(UrlLib.img_buzhenBg(),173,41,0,true,false);
         boxIngoreRoScale.addChild(this.bg);
         this.bg.renderLayer = Entity.TOP_LAYER;
         this.bg.mouseEnabled = false;
         bg.z = 1;
      }
   }
}
