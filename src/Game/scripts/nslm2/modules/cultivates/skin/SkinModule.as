package nslm2.modules.cultivates.skin
{
   import game.ui.skinModule.SkinModuleUI;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import nslm2.modules.cultivates.skin.service.SkinService;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.cultivates.skin.render.SkinEquipRender;
   import nslm2.nets.sockets.ServerEngine;
   import flash.events.MouseEvent;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import com.mz.core.event.MzEvent;
   import proto.HeroSkinInfoRes;
   import nslm2.modules.roleInfos.vo.RoleInfoModuleParam;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.DisplayUtils;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import flash.geom.Point;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import morn.core.components.Button;
   import away3d.bounds.NullBounds;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.components.Image;
   import com.mz.core.utils.FilterUtil;
   import morn.core.handlers.Handler;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.ArrayUtil;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import game.ui.roleInfos.NpcProp2Vo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.LocalData;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.ctrls.BtnLongBarCtrl;
   
   public class SkinModule extends SkinModuleUI
   {
       
      
      private var _avatar:UIUnit3D;
      
      private var _panel3D:UIPanel3D;
      
      private var info:Array;
      
      private var model:nslm2.modules.cultivates.skin.SkinModel;
      
      private var _effectIsShowingArr:Array;
      
      private var _clothSelectedId:uint;
      
      private var service:SkinService;
      
      private var _nowShowIndex:int;
      
      private var skinArr:Array;
      
      public function SkinModule()
      {
         model = nslm2.modules.cultivates.skin.SkinModel.ins;
         _effectIsShowingArr = [];
         service = SkinService.ins;
         super();
         LocalData.insCurPlayer.save("evtSkinSelect",true);
         this.panelBg.bgCustom.addChild(this.img_bg);
         this.panelBg.bgCustom.addChild(this.img_blackBg);
         ObserverMgr.ins.regObserver(this);
         MornExpandUtil.addHandlerForBtnAll(this,onBtnClick);
         this.parts.push(new BtnLongBarCtrl(this.btn_leftArrow,img_leftBg));
         this.parts.push(new BtnLongBarCtrl(this.btn_rightArrow,img_rightBg));
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarRef as IPageBar;
      }
      
      public function get skinRender() : SkinEquipRender
      {
         return this.skinRenderRef as SkinEquipRender;
      }
      
      override public function moduleServerStart(param1:*) : void
      {
         ServerEngine.ins.send(5022,null,skinInfoCpl);
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.skinRender.box_wealth.addEventListener("click",onClothClick);
            this.model.addEventListener("evtFashionUsingChange",serviceHandler);
            this.model.addEventListener("evtActivateCpl",onActivateCpl);
            this.btn_leftArrow.addEventListener("click",doIndexMinus);
            this.btn_rightArrow.addEventListener("click",doIndexAdd);
         }
         else
         {
            this.skinRender.removeEventListener("click",onClothClick);
            this.model.removeEventListener("evtFashionUsingChange",serviceHandler);
            this.model.removeEventListener("evtActivateCpl",onActivateCpl);
            this.btn_leftArrow.removeEventListener("click",doIndexMinus);
            this.btn_rightArrow.removeEventListener("click",doIndexAdd);
         }
         super.switchEventListeners(param1);
      }
      
      private function doIndexAdd(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         _nowShowIndex = Number(_nowShowIndex) + 1;
         _loc2_ = HeroModel.ins.teamHeroInfoArr;
         if(_nowShowIndex >= _loc2_.length)
         {
            _nowShowIndex = _nowShowIndex - _loc2_.length;
         }
         plusCheck(_loc2_);
         initByHeroInfo(_loc2_[_nowShowIndex]);
      }
      
      private function doIndexMinus(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         _nowShowIndex = Number(_nowShowIndex) - 1;
         _loc2_ = HeroModel.ins.teamHeroInfoArr;
         if(_nowShowIndex < 0)
         {
            _nowShowIndex = _nowShowIndex + _loc2_.length;
         }
         minusCheck(_loc2_);
         initByHeroInfo(_loc2_[_nowShowIndex]);
      }
      
      private function plusCheck(param1:Array) : void
      {
         if(nslm2.modules.cultivates.skin.SkinModel.ins.getSkinAvailArrByNpcId((param1[_nowShowIndex] as HeroInfo).baseInfo.baseId).length == 0)
         {
            _nowShowIndex = Number(_nowShowIndex) + 1;
            if(_nowShowIndex >= param1.length)
            {
               _nowShowIndex = _nowShowIndex - param1.length;
            }
            plusCheck(param1);
         }
      }
      
      private function minusCheck(param1:Array) : void
      {
         if(nslm2.modules.cultivates.skin.SkinModel.ins.getSkinAvailArrByNpcId((param1[_nowShowIndex] as HeroInfo).baseInfo.baseId).length == 0)
         {
            _nowShowIndex = Number(_nowShowIndex) - 1;
            if(_nowShowIndex < 0)
            {
               _nowShowIndex = _nowShowIndex + param1.length;
            }
            minusCheck(param1);
         }
      }
      
      private function serviceHandler(param1:MzEvent) : void
      {
         var _loc2_:* = param1.type;
         if("evtFashionUsingChange" === _loc2_)
         {
            _loc2_ = param1.data[0];
            if("OK" === _loc2_)
            {
               refresh();
            }
         }
      }
      
      private function onActivateCpl(param1:MzEvent) : void
      {
         refresh(true);
      }
      
      private function skinInfoCpl(param1:HeroSkinInfoRes) : void
      {
         if(param1)
         {
            model.parseInfo(param1);
         }
         super.moduleServerCpl();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         model.curHeroInfo = (param1 as RoleInfoModuleParam).heroInfo;
         txt_noSkin.text = LocaleMgr.ins.getStr(30400002);
         skinArr = this.model.fashionSuitList;
         if(skinArr.length > 0)
         {
            this.list_suit.visible = true;
            this.txt_noSkin.visible = false;
            this.list_suit.dataSource = skinArr;
         }
         else
         {
            this.list_suit.visible = false;
            this.txt_noSkin.visible = true;
         }
         this.pageBar.bindList(this.list_suit);
         _nowShowIndex = HeroModel.ins.teamHeroInfoArr.indexOf(model.curHeroInfo);
         this._panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(_panel3D,this.img_bg);
         this._panel3D.initByImage(img_bg,this.panelBg);
         this._panel3D.visible = false;
         this._avatar = new UIUnit3D();
         this._panel3D.addChild3D(_avatar);
         this.createAvatar3D();
         this.panelBg.titleImgId = this.moduleId;
         refresh();
         super.preShowCpl();
      }
      
      private function initByHeroInfo(param1:HeroInfo) : void
      {
         model.curHeroInfo = param1;
         skinArr = this.model.fashionSuitList;
         if(skinArr.length > 0)
         {
            this.list_suit.visible = true;
            this.txt_noSkin.visible = false;
            this.list_suit.dataSource = skinArr;
         }
         else
         {
            this.list_suit.visible = false;
            this.txt_noSkin.visible = true;
         }
         this.pageBar.bindList(this.list_suit);
         this.createAvatar3D();
         refresh();
      }
      
      override public function show(param1:Object = null) : void
      {
         this._panel3D.visible = true;
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",true);
         super.show(param1);
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         this._clothSelectedId = this.model.usingSkinId;
         this.skinRender.kind = 14;
         this.skinRender.dataSource = this.model.usingSkinId == 0?null:WealthUtil.createItemVo(this.model.usingSkinId);
         this.createAvatar3D();
         redPoint.visible = model.inactiveArr.length > 0;
         if(param1)
         {
            if(ModuleMgr.ins.popLayer.curModuleId == this.moduleId)
            {
               _loc2_ = model.skinAddFight - this.fightValueBox.txt_fightValue.value;
               AlertUtil.showFightPowerChangeTip(_loc2_,fightValueChangeHandler,DisplayUtils.globarCenter(this.fightValueBox),DisplayUtils.globarCenter(this).add(new Point(0,-50)));
            }
            else
            {
               (this.fightValueBox as FightValueBox).tweenValue = model.skinAddFight;
            }
         }
         else
         {
            (this.fightValueBox as FightValueBox).tweenValue = model.skinAddFight;
         }
         this.showAddProp(param1);
      }
      
      public function fightValueChangeHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         (this.fightValueBox as FightValueBox).tweenValue = model.skinAddFight;
      }
      
      private function onBtnClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_skill === _loc2_)
         {
            ModuleMgr.ins.showModule(31110,NullBounds,ModuleMgr.ins.popLayer.curModuleId);
         }
      }
      
      private function onClothClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(this.skinRender.wealthVo)
         {
            _loc2_ = new FashionEffectVO();
            _loc2_.id = this.skinRender.wealthVo.sid;
            ObserverMgr.ins.sendNotice("evtSkinSelect",_loc2_);
         }
         else if(model.hasActivatedSkin())
         {
            AlertUtil.float(LocaleMgr.ins.getStr(51800108));
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int((skinArr[0] as StcItemVo).get_point)),31100);
            return;
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return ["evtSkinSelect"];
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         if(_effectIsShowingArr.indexOf((param2 as FashionEffectVO).id) != -1)
         {
            return;
         }
         var _loc3_:* = param1;
         if("evtSkinSelect" === _loc3_)
         {
            showSkinSelectEffect(param2 as FashionEffectVO);
         }
      }
      
      private function showSkinSelectEffect(param1:FashionEffectVO) : void
      {
         var _loc2_:* = null;
         if(param1.id != _clothSelectedId)
         {
            _effectIsShowingArr.push(param1.id);
            _loc2_ = IconFlyEff.copyImage(param1.image);
            _loc2_.filters = !!model.hasActivatedSkin()?null:[FilterUtil.grayFilter()];
            new IconFlyEff(_loc2_,param1.startPoint,this.skinRender.img_icon).addCompleteHandler(new Handler(clothEffCpl,[param1])).exec();
         }
         else if(model.isActive(param1.id) || model.isUsed(param1.id))
         {
            service.clothesWear(0);
         }
         else
         {
            this._clothSelectedId = model.usingSkinId;
            this.skinRender.dataSource = this._clothSelectedId == 0?null:WealthUtil.createItemVo(this._clothSelectedId);
            this.createAvatar3D();
            this.showAddProp(false);
         }
      }
      
      private function clothEffCpl(param1:FashionEffectVO) : void
      {
         this._clothSelectedId = param1.id;
         this.skinRender.dataSource = this._clothSelectedId == 0?null:WealthUtil.createItemVo(this._clothSelectedId);
         var _loc2_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc2_.x = this.skinRender.x - 34;
         _loc2_.y = this.skinRender.y - 34;
         _loc2_.init(1060);
         this.addChild(_loc2_);
         if(model.isActive(param1.id))
         {
            service.clothesWear(param1.id);
         }
         else
         {
            this.showAddProp();
            this.createAvatar3D();
         }
         ArrayUtil.removeItem(_effectIsShowingArr,param1.id);
      }
      
      private function showAddProp(param1:Boolean = false) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc5_:* = null;
         var _loc9_:uint = this.model.activeArr.length;
         var _loc3_:* = _loc9_;
         var _loc4_:uint = 0;
         if(_clothSelectedId != 0 && !(model.isActive(_clothSelectedId) || model.isUsed(_clothSelectedId)))
         {
            _loc4_++;
            _loc7_ = NpcPropVo.parseItemVo(StcMgr.ins.getItemVo(_clothSelectedId));
         }
         this.txt_propTitle.text = LocaleMgr.ins.getStr(51800109,[_loc3_]);
         var _loc2_:Array = NpcPropVo.addProp(_loc7_,[]);
         var _loc6_:Array = this.model.skinAddProp.concat();
         if(param1)
         {
            _loc8_ = _loc6_.length;
            _loc10_ = 0;
            while(_loc10_ < _loc8_)
            {
               _loc5_ = _loc6_[_loc10_];
               if(ModuleMgr.ins.popLayer.curModuleId == this.moduleId)
               {
                  _loc5_.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
               }
               _loc10_++;
            }
         }
         this.list_fashionProp.dataSource = NpcProp2Vo.parseTwoPropArr(_loc6_,_loc2_);
      }
      
      private function createAvatar3D() : void
      {
         if(_avatar)
         {
            this._avatar.x = -119;
            this._avatar.y = -150;
            this._avatar.stcNpcId = StcMgr.ins.getNpcVo(model.curHeroInfo.baseInfo.baseId).node;
            PlayerModel.ins.changePlayerView(this._avatar,StcMgr.ins.getNpcVo(model.curHeroInfo.baseInfo.baseId).node,_clothSelectedId,0);
         }
      }
      
      override public function preClose(param1:Object = null) : void
      {
         this._panel3D.dispose();
         this._panel3D = null;
         _avatar.dispose();
         _avatar = null;
         ObserverMgr.ins.sendNotice("lock_total_fight_value_change",false);
         super.preClose(param1);
      }
   }
}
