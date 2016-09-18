package nslm2.modules.cultivates.fashion.panels
{
   import game.ui.fashionModules.panels.FashionPanelUI;
   import nslm2.modules.cultivates.fashion.interfaces.IAvatarPanel;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.modules.cultivates.fashion.FashionEquipRender;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.cultivates.fashion.FashionService;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import nslm2.modules.scenes.commons.Unit3DBase;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.core.components.Button;
   import nslm2.common.model.HeroModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.WealthUtil;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeModel;
   import com.mz.core.event.MzEvent;
   import flash.events.MouseEvent;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.components.Image;
   import com.mz.core.utils.FilterUtil;
   import morn.core.handlers.Handler;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.ArrayUtil;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import game.ui.roleInfos.NpcProp2Vo;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeCtrl;
   
   public class FashionPanel extends FashionPanelUI implements IAvatarPanel, IObserver, IViewStackPage
   {
       
      
      private var _avatar:UIUnit3D;
      
      private var _clothSelectedId:int = 0;
      
      private var _wingSelectedId:int = 0;
      
      private var _skillPanelIsShow:Boolean;
      
      private var _effectIsShowingArr:Array;
      
      public function FashionPanel()
      {
         _effectIsShowingArr = [];
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnClick);
         this.parts.push(new SkillChangeCtrl(this.btn_skill));
      }
      
      public function get clothRender() : FashionEquipRender
      {
         return this.clothRenderRef as FashionEquipRender;
      }
      
      public function get wingRender() : FashionEquipRender
      {
         return this.wingRenderRef as FashionEquipRender;
      }
      
      public function get pageBar() : IPageBar
      {
         return this.pageBarRef as IPageBar;
      }
      
      private function get service() : FashionService
      {
         return FashionService.ins;
      }
      
      private function get model() : FashionModel
      {
         return FashionModel.ins;
      }
      
      public function set avatar3D(param1:Unit3DBase) : void
      {
         this._avatar = param1 as UIUnit3D;
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         switchEventListeners(true);
         this.list_suit.dataSource = this.model.fashionSuitList;
         refresh();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         this.visible = false;
      }
      
      private function onBtnClick(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_skill === _loc2_)
         {
            this.changeSkillRedPoint.visible = false;
         }
      }
      
      private function createAvatar3D() : void
      {
         if(_avatar)
         {
            this._avatar.x = -119;
            this._avatar.y = -150;
            this._avatar.stcNpcId = HeroModel.ins.playerHero.baseInfo.baseId;
            PlayerModel.ins.changePlayerView(this._avatar,HeroModel.ins.playerHero.baseInfo.baseId,_clothSelectedId,_wingSelectedId);
         }
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         this._clothSelectedId = this.model.usingClothId;
         this._wingSelectedId = this.model.usingWingId;
         this.wingRender.kind = 12;
         this.clothRender.kind = 10;
         this.clothRender.dataSource = this.model.usingClothId == 0?null:WealthUtil.createItemVo(this.model.usingClothId);
         this.wingRender.dataSource = this.model.usingWingId == 0?null:WealthUtil.createItemVo(this.model.usingWingId);
         this.pageBar.bindList(list_suit);
         this.createAvatar3D();
         if(param1)
         {
            _loc2_ = Uint64Util.toNumber(FashionModel.ins.fashionAddFight) - this.fightValueBox.txt_fightValue.value;
            AlertUtil.showFightPowerChangeTip(_loc2_,fightValueChangeHandler,DisplayUtils.globarCenter(this.fightValueBox),DisplayUtils.globarCenter(this).add(new Point(0,-50)));
         }
         else
         {
            (this.fightValueBox as FightValueBox).tweenValue = Uint64Util.toNumber(FashionModel.ins.fashionAddFight);
         }
         this.showAddProp(param1);
         if(SkillChangeModel.ins.newNorSkillVec.length != 0 || SkillChangeModel.ins.newSpeSkillVec.length != 0)
         {
            this.changeSkillRedPoint.visible = true;
         }
         else
         {
            this.changeSkillRedPoint.visible = false;
         }
      }
      
      public function fightValueChangeHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         (this.fightValueBox as FightValueBox).tweenValue = Uint64Util.toNumber(FashionModel.ins.fashionAddFight);
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.clothRender.box_wealth.addEventListener("click",onClothClick);
            this.wingRender.box_wealth.addEventListener("click",onWingClick);
            this.model.addEventListener("evtFashionUsingChange",serviceHandler);
            this.model.addEventListener("evtActivateCpl",onActivateCpl);
         }
         else
         {
            this.clothRender.removeEventListener("click",onClothClick);
            this.wingRender.removeEventListener("click",onWingClick);
            this.model.removeEventListener("evtFashionUsingChange",serviceHandler);
            this.model.removeEventListener("evtActivateCpl",onActivateCpl);
         }
      }
      
      private function onActivateCpl(param1:MzEvent) : void
      {
         refresh(true);
      }
      
      private function onClothClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.clothRender.wealthVo)
         {
            _loc2_ = new FashionEffectVO();
            _loc2_.id = this.clothRender.wealthVo.sid;
            _loc3_ = StcMgr.ins.getItemVo(this.clothRender.wealthVo.sid);
            ObserverMgr.ins.sendNotice("evtClothSelect",_loc2_);
         }
         else if(model.hasActivatedFashionByKind(10))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30200010));
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.CLOTHES_LESS_ID)),30200);
            return;
         }
      }
      
      private function onWingClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.wingRender.wealthVo)
         {
            _loc2_ = new FashionEffectVO();
            _loc2_.id = this.wingRender.wealthVo.sid;
            _loc3_ = StcMgr.ins.getItemVo(this.wingRender.wealthVo.sid);
            ObserverMgr.ins.sendNotice("evtWingSelect",_loc2_);
         }
         else if(model.hasActivatedFashionByKind(12))
         {
            AlertUtil.float(LocaleMgr.ins.getStr(30200010));
         }
         else
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.CLOTHES_LESS_ID)),30200);
            return;
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
      
      private function showClothSelectEffect(param1:FashionEffectVO) : void
      {
         var _loc2_:* = null;
         if(param1.id != _clothSelectedId)
         {
            _effectIsShowingArr.push(param1.id);
            _loc2_ = IconFlyEff.copyImage(param1.image);
            _loc2_.filters = !!model.hasActivatedFashion(param1.id)?null:[FilterUtil.grayFilter()];
            new IconFlyEff(_loc2_,param1.startPoint,this.clothRender.img_icon).addCompleteHandler(new Handler(clothEffCpl,[param1])).exec();
         }
         else if(FashionModel.ins.hasActivatedFashion(param1.id))
         {
            service.clothesWear(10,0);
         }
         else
         {
            this._clothSelectedId = FashionModel.ins.usingClothId;
            this.clothRender.dataSource = this._clothSelectedId == 0?null:WealthUtil.createItemVo(this._clothSelectedId);
            this.createAvatar3D();
            this.showAddProp(false);
         }
      }
      
      private function clothEffCpl(param1:FashionEffectVO) : void
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1.id);
         this._clothSelectedId = param1.id;
         this.clothRender.dataSource = this._clothSelectedId == 0?null:WealthUtil.createItemVo(this._clothSelectedId);
         var _loc3_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc3_.x = this.clothRender.x - 34;
         _loc3_.y = this.clothRender.y - 34;
         _loc3_.init(1060);
         this.addChild(_loc3_);
         if(FashionModel.ins.hasActivatedFashion(param1.id))
         {
            service.clothesWear(10,param1.id);
         }
         else
         {
            this.showAddProp();
            this.createAvatar3D();
         }
         ArrayUtil.removeItem(_effectIsShowingArr,param1.id);
      }
      
      private function showWingSelectEffect(param1:FashionEffectVO) : void
      {
         var _loc2_:* = null;
         if(param1.id != _wingSelectedId)
         {
            _effectIsShowingArr.push(param1.id);
            _loc2_ = IconFlyEff.copyImage(param1.image);
            _loc2_.filters = !!model.hasActivatedFashion(param1.id)?null:[FilterUtil.grayFilter()];
            new IconFlyEff(_loc2_,param1.startPoint,this.wingRender.img_icon).addCompleteHandler(new Handler(wingEffCpl,[param1])).exec();
         }
         else if(FashionModel.ins.hasActivatedFashion(param1.id))
         {
            service.clothesWear(12,0);
         }
         else
         {
            this._wingSelectedId = FashionModel.ins.usingWingId;
            this.wingRender.dataSource = this._wingSelectedId == 0?null:WealthUtil.createItemVo(this._wingSelectedId);
            this.createAvatar3D();
            this.showAddProp(false);
         }
      }
      
      private function wingEffCpl(param1:FashionEffectVO) : void
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1.id);
         this._wingSelectedId = param1.id;
         this.wingRender.dataSource = this._wingSelectedId == 0?null:WealthUtil.createItemVo(this._wingSelectedId);
         var _loc3_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc3_.x = this.wingRender.x - 34;
         _loc3_.y = this.wingRender.y - 34;
         _loc3_.init(1060);
         this.addChild(_loc3_);
         if(FashionModel.ins.hasActivatedFashion(param1.id))
         {
            service.clothesWear(12,param1.id);
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
         var _loc10_:* = null;
         var _loc5_:* = null;
         var _loc8_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc7_:* = null;
         var _loc9_:uint = this.model.activatedClothArr.length;
         var _loc3_:uint = this.model.activatedWingArr.length;
         var _loc4_:uint = _loc9_ + _loc3_;
         var _loc6_:uint = 0;
         if(_clothSelectedId != 0 && !model.hasActivatedFashion(_clothSelectedId))
         {
            _loc6_++;
            _loc10_ = NpcPropVo.parseItemVo(StcMgr.ins.getItemVo(_clothSelectedId));
         }
         if(_wingSelectedId != 0 && !model.hasActivatedFashion(_wingSelectedId))
         {
            _loc6_++;
            _loc5_ = NpcPropVo.parseItemVo(StcMgr.ins.getItemVo(_wingSelectedId));
         }
         if(_loc6_ == 0)
         {
            this.txt_propTitle.text = LocaleMgr.ins.getStr(30200011,[_loc4_]);
         }
         else
         {
            this.txt_propTitle.text = LocaleMgr.ins.getStr(30200011,[_loc4_ + TextFieldUtil.htmlText("+" + _loc6_,new TextFormat(null,null,458496))]);
         }
         this.txt_propTitle.toolTip = LocaleMgr.ins.getStr(30200002);
         var _loc2_:Array = NpcPropVo.addProp(_loc10_,_loc5_);
         _loc8_ = this.model.fashionAddProp.concat();
         if(param1)
         {
            _loc11_ = _loc8_.length;
            _loc12_ = 0;
            while(_loc12_ < _loc11_)
            {
               _loc7_ = _loc8_[_loc12_];
               _loc7_.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
               _loc12_++;
            }
         }
         this.list_fashionProp.dataSource = NpcProp2Vo.parseTwoPropArr(_loc8_,_loc2_);
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         if(param2 as FashionEffectVO)
         {
            if(_effectIsShowingArr.indexOf((param2 as FashionEffectVO).id) != -1)
            {
               return;
            }
         }
         var _loc3_:* = param1;
         if("evtClothSelect" !== _loc3_)
         {
            if("evtWingSelect" === _loc3_)
            {
               showWingSelectEffect(param2 as FashionEffectVO);
            }
         }
         else
         {
            showClothSelectEffect(param2 as FashionEffectVO);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtClothSelect","evtWingSelect"];
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         super.dispose();
      }
   }
}
