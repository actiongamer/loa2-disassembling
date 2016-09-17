package nslm2.modules.cultivates.fashion.panels
{
   import game.ui.fashionModules.panels.FashionAccPanelUI;
   import com.mz.core.interFace.IObserver;
   import com.mz.core.interFace.IViewStackPage;
   import nslm2.modules.cultivates.fashion.FashionEquipRender;
   import nslm2.common.ui.components.comps2d.pageBar.IPageBar;
   import nslm2.modules.cultivates.fashion.FashionService;
   import nslm2.modules.cultivates.fashion.FashionModel;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.bag.itemModuels.BagModel;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.cultivates.fashion.FashionEffectVO;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.common.uiEffects.IconFlyEff;
   import morn.core.components.Image;
   import com.mz.core.utils.FilterUtil;
   import morn.core.handlers.Handler;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   import nslm2.common.ui.components.comps2d.others.FightValueBox;
   import game.ui.roleInfos.NpcProp2Vo;
   
   public class FashionAccPanel extends FashionAccPanelUI implements IObserver, IViewStackPage
   {
       
      
      private var _accLeftSelectedId:int = 0;
      
      private var _accRightSelectedId:int = 0;
      
      private var _skillPanelIsShow:Boolean;
      
      private var _effectIsShowingArr:Array;
      
      private var accArr:Array;
      
      public function FashionAccPanel()
      {
         _effectIsShowingArr = [];
         accArr = [];
         super();
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
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         switchEventListeners(true);
         refresh();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         switchEventListeners(false);
         this.visible = false;
      }
      
      private function refresh(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         this._accLeftSelectedId = this.model.usingLeftAccId;
         this._accRightSelectedId = this.model.usingRightAccId;
         this.clothRender.dataSource = this.model.usingLeftAccId == 0?null:WealthUtil.createItemVo(this.model.usingLeftAccId);
         this.wingRender.dataSource = this.model.usingRightAccId == 0?null:WealthUtil.createItemVo(this.model.usingRightAccId);
         this.pageBar.bindList(list_acc);
         accArr = BagModel.ins.getFashionAccArr(0);
         if(accArr.length == 0 || accArr.length % 18)
         {
            _loc2_ = accArr.length;
            _loc3_ = 0;
            while(_loc3_ < 18 - _loc2_ % 18)
            {
               accArr.push(null);
               _loc3_++;
            }
         }
         this.list_acc.dataSource = accArr;
         this.showAddProp(param1);
      }
      
      public function fightValueChangeHandler() : void
      {
         if(this.isDisposed)
         {
            return;
         }
      }
      
      public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.clothRender.box_wealth.addEventListener("click",onClothClick);
            this.wingRender.box_wealth.addEventListener("click",onWingClick);
            this.model.addEventListener("evtFashionUsingChange",serviceHandler);
            this.model.addEventListener("evtActivateCpl",onActivateCpl);
            this.btn_skill.addEventListener("click",onShowAccSkill);
         }
         else
         {
            this.clothRender.removeEventListener("click",onClothClick);
            this.wingRender.removeEventListener("click",onWingClick);
            this.model.removeEventListener("evtFashionUsingChange",serviceHandler);
            this.model.removeEventListener("evtActivateCpl",onActivateCpl);
            this.btn_skill.removeEventListener("click",onShowAccSkill);
         }
      }
      
      protected function onShowAccSkill(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(31221,null,30200);
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
            ObserverMgr.ins.sendNotice("evtAccSelect",_loc2_);
         }
         else if(BagModel.ins.getFashionAccArr(0).length > 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210007));
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
            ObserverMgr.ins.sendNotice("evtAccSelect",_loc2_);
         }
         else if(BagModel.ins.getFashionAccArr(0).length > 0)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(31210007));
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
      
      private function clothEffCpl(param1:FashionEffectVO) : void
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1.id);
         this._accLeftSelectedId = param1.id;
         this.clothRender.dataSource = this._accLeftSelectedId == 0?null:WealthUtil.createItemVo(this._accLeftSelectedId);
         var _loc3_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc3_.x = this.clothRender.x - 34;
         _loc3_.y = this.clothRender.y - 34;
         _loc3_.init(1060);
         this.addChild(_loc3_);
         service.fashionAccWear(15,1,param1.id);
         ArrayUtil.removeItem(_effectIsShowingArr,param1.id);
      }
      
      private function showAccSelectEffect(param1:FashionEffectVO) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1.id);
         if(param1.id != _accLeftSelectedId && param1.id != _accRightSelectedId)
         {
            _effectIsShowingArr.push(param1.id);
            _loc4_ = IconFlyEff.copyImage(param1.image);
            _loc4_.filters = !!model.hasActivatedFashion(param1.id)?null:[FilterUtil.grayFilter()];
            new IconFlyEff(_loc4_,param1.startPoint,_loc2_.kind == 15?this.clothRender.img_icon:this.wingRender.img_icon).addCompleteHandler(new Handler(_loc2_.kind == 15?clothEffCpl:wingEffCpl,[param1])).exec();
         }
         else
         {
            _loc3_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","item",param1.id);
            service.fashionAccWear(StcMgr.ins.getFashionExtraSkillVo(_loc3_.skill).kind == 1?15:16,0,param1.id);
         }
      }
      
      private function wingEffCpl(param1:FashionEffectVO) : void
      {
         var _loc2_:StcItemVo = StcMgr.ins.getItemVo(param1.id);
         this._accRightSelectedId = param1.id;
         this.wingRender.dataSource = this._accRightSelectedId == 0?null:WealthUtil.createItemVo(this._accRightSelectedId);
         var _loc3_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc3_.x = this.wingRender.x - 34;
         _loc3_.y = this.wingRender.y - 34;
         _loc3_.init(1060);
         this.addChild(_loc3_);
         service.fashionAccWear(16,1,param1.id);
         ArrayUtil.removeItem(_effectIsShowingArr,param1.id);
      }
      
      private function showAddProp(param1:Boolean = false) : void
      {
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc3_:int = 0;
         var _loc7_:uint = this.model.activatedClothArr.length;
         var _loc2_:uint = this.model.activatedWingArr.length;
         var _loc4_:uint = _loc7_ + _loc2_;
         var _loc5_:uint = 0;
         if(_loc5_ == 0)
         {
            this.txt_propTitle.text = LocaleMgr.ins.getStr(30200011,[_loc4_]);
         }
         else
         {
            this.txt_propTitle.text = LocaleMgr.ins.getStr(30200011,[_loc4_ + TextFieldUtil.htmlText("+" + _loc5_,new TextFormat(null,null,458496))]);
         }
         this.txt_propTitle.toolTip = LocaleMgr.ins.getStr(30200002);
         this.txt_propTitle.text = LocaleMgr.ins.getStr(31210008);
         _loc6_ = NpcPropVo.getEmptyPopArr(1,5,0);
         var _loc12_:int = 0;
         var _loc11_:* = accArr;
         for each(var _loc10_ in accArr)
         {
            if(_loc10_)
            {
               _loc8_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","item",_loc10_.itemId);
               NpcPropVo.addProp(_loc6_,NpcPropVo.parseArrStr(_loc8_.prop));
            }
         }
         var _loc9_:int = NPCPropConsts.ins.countFightValue_propArr(_loc6_);
         if(param1)
         {
            _loc3_ = _loc9_ - this.fightValueBox.txt_fightValue.value;
            AlertUtil.showFightPowerChangeTip(_loc3_,fightValueChangeHandler,DisplayUtils.globarCenter(this.fightValueBox),DisplayUtils.globarCenter(this).add(new Point(0,-50)));
         }
         else
         {
            (this.fightValueBox as FightValueBox).tweenValue = _loc9_;
         }
         this.list_fashionProp.dataSource = NpcProp2Vo.parseTwoPropArr(NpcPropVo.filterZeroProp(_loc6_),[]);
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2 as FashionEffectVO)
         {
            if(_effectIsShowingArr.indexOf((param2 as FashionEffectVO).id) != -1)
            {
               return;
            }
         }
         var _loc6_:* = param1;
         if("evtAccSelect" !== _loc6_)
         {
            if("evt_refresh_acc_list" === _loc6_)
            {
               _loc3_ = BagModel.ins.getFashionAccArr(0);
               if(_loc3_.length == 0 || _loc3_.length % 12)
               {
                  _loc4_ = _loc3_.length;
                  _loc5_ = 0;
                  while(_loc5_ < 16 - _loc4_ % 16)
                  {
                     _loc3_.push(null);
                     _loc5_++;
                  }
               }
               this.list_acc.dataSource = _loc3_;
               this.pageBar.bindList(list_acc);
            }
         }
         else
         {
            showAccSelectEffect(param2 as FashionEffectVO);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtAccSelect","evt_refresh_acc_list"];
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
