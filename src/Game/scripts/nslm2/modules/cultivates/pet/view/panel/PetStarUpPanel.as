package nslm2.modules.cultivates.pet.view.panel
{
   import game.ui.petModule.star.PetStarPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import nslm2.mgrs.stcMgrs.vos.StcPetStarVo;
   import nslm2.utils.WealthUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.PetInfo;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import com.mz.core.utils.DisplayUtils;
   import morn.core.components.Button;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.cultivates.pet.service.PetService;
   import org.specter3d.display.particle.SpecterEffect;
   import com.greensock.TweenLite;
   import flash.geom.Point;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import flash.events.Event;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.common.compsEffects.FloatUpDownEffCtrl;
   
   public class PetStarUpPanel extends PetStarPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var petModel:PetModel;
      
      private var starUpEff:BmcSpriteSheet;
      
      private var eff:SpecterEffect;
      
      private var needShowPropTip:Boolean;
      
      private var _tujianPanel:nslm2.modules.cultivates.pet.view.panel.PetStarPreViewPanel;
      
      public function PetStarUpPanel()
      {
         petModel = PetModel.ins;
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         this.parts.push(new FloatUpDownEffCtrl().config(0.4).init(this.list_up,this.list_up.y,2,2));
      }
      
      public function getFocusNotices() : Array
      {
         return ["change_selected_pet","msg_item_num_change"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = param1;
         if("change_selected_pet" !== _loc4_)
         {
            if("msg_item_num_change" === _loc4_)
            {
               _loc3_ = PetUtil.getPetStarVo(petModel.crtPetInfo.id,petModel.crtPetInfo.star);
               list_cost.dataSource = WealthUtil.costStrToArr(_loc3_.cost);
            }
         }
         else
         {
            update();
         }
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         ObserverMgr.ins.regObserver(this);
         update();
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         clear();
         this.visible = false;
      }
      
      public function update() : void
      {
         var _loc15_:int = 0;
         var _loc2_:* = null;
         var _loc16_:* = null;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         var _loc13_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc14_:* = null;
         var _loc5_:* = null;
         var _loc11_:int = 0;
         var _loc8_:* = null;
         var _loc1_:* = null;
         var _loc4_:* = null;
         var _loc12_:* = null;
         var _loc10_:* = null;
         var _loc17_:PetInfo = petModel.crtPetInfo;
         var _loc18_:int = 1;
         if(_loc17_)
         {
            _loc2_ = petModel.getStaticData(_loc17_.id);
            txt_nowStar.text = LocaleMgr.ins.getStr(32000040,[_loc17_.star]);
            _loc16_ = PetUtil.getStarPropBffArr(_loc17_.id,_loc17_.star);
            if(!_loc16_.length)
            {
               _loc16_ = NpcPropVo.getEmptyPopArr(1,5,0,"+");
            }
            if(needShowPropTip)
            {
               _loc7_ = _loc16_.length;
               _loc9_ = 0;
               while(_loc9_ < _loc7_)
               {
                  _loc13_ = _loc16_[_loc9_];
                  _loc13_.floatPos = DisplayUtils.globarCenter(this);
                  _loc9_++;
               }
            }
            list_crtProp.dataSource = _loc16_;
            list_crtProp.commitMeasure();
            _loc3_ = PetUtil.getPosBuffArr(_loc17_.id,_loc17_.star,"+");
            if(needShowPropTip)
            {
               _loc6_ = PetUtil.getPosBuffArr(_loc17_.id,_loc17_.star - 1,"+");
               _loc9_ = 0;
               while(_loc9_ < _loc3_.length)
               {
                  _loc14_ = _loc3_[_loc9_] as NpcPropVo;
                  if(_loc6_.length <= _loc9_)
                  {
                     _loc5_ = new NpcPropVo(_loc14_.propId,0,"+");
                     _loc6_.push(_loc5_);
                  }
                  _loc14_.floatPos = DisplayUtils.globarCenter(this);
                  _loc9_++;
               }
               posBuffView.list_petBuff.dataSource = _loc6_;
               posBuffView.commitMeasure();
            }
            posBuffView.list_petBuff.dataSource = _loc3_;
            posBuffView.commitMeasure();
            needShowPropTip = false;
            _loc11_ = _loc17_.star + 1;
            _loc8_ = PetUtil.getPetStarVo(_loc17_.id,_loc17_.star);
            _loc1_ = PetUtil.getPetStarVo(_loc17_.id,_loc11_);
            if(!_loc1_)
            {
               box_nextLvl.visible = false;
               btn_startUp.disabled = true;
               list_up.visible = false;
               txt_lvlLimit.text = "";
               box_op.visible = false;
            }
            else
            {
               box_op.visible = true;
               _loc4_ = PetUtil.getPetStarPropAddedList(_loc17_.id,_loc17_.star,_loc11_);
               _loc12_ = PetUtil.getStarPropBffArr(_loc17_.id,_loc1_.level);
               box_nextLvl.visible = true;
               btn_startUp.disabled = false;
               list_nextProp.dataSource = _loc12_;
               posBuffViewNext.list_petBuff.dataSource = PetUtil.getPosBuffArr(_loc17_.id,_loc11_,"+");
               list_up.visible = true;
               txt_nextStar.text = LocaleMgr.ins.getStr(32000040,[_loc11_]);
               if(_loc8_.need_level > _loc17_.level)
               {
                  txt_lvlLimit.text = LocaleMgr.ins.getStr(32000025,[_loc8_.need_level]);
                  btn_startUp.disabled = true;
               }
               else
               {
                  txt_lvlLimit.text = "";
                  btn_startUp.disabled = false;
               }
            }
            _loc10_ = PetModel.getStarLightArray(_loc17_.star);
            if(_loc17_.star < 10)
            {
               list_stars2.visible = false;
            }
            else if(PetModel.maxStar > 10)
            {
               list_stars2.repeatX = _loc10_.length - 10;
               list_stars2.dataSource = _loc10_.splice(10,list_stars2.repeatX);
               list_stars2.visible = true;
            }
            else
            {
               list_stars2.visible = false;
            }
            list_stars.dataSource = _loc10_;
            if(_loc8_)
            {
               list_cost.dataSource = WealthUtil.costStrToArr(_loc8_.cost);
            }
         }
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = param1;
         if(btn_startUp !== _loc6_)
         {
            if(btn_tj === _loc6_)
            {
               showTujianPanel();
            }
         }
         else
         {
            _loc4_ = list_cost.dataSource as Array;
            _loc3_ = _loc4_.length;
            _loc5_ = 0;
            while(_loc5_ < _loc3_)
            {
               _loc2_ = _loc4_[_loc5_];
               if(PlayerModel.ins.getCountByWealthVo(_loc2_) < _loc2_.count)
               {
                  AlertUtil.lackItem(_loc2_);
                  return;
               }
               _loc5_++;
            }
            PetService.ins.petStarUp(petModel.crtPetId,starUpSuccessHandler);
         }
      }
      
      private function starUpSuccessHandler(param1:Object) : void
      {
         ObserverMgr.ins.sendNotice("set_pet_list_enable",false);
         playStarUpEff();
      }
      
      private function playStarUpEff() : void
      {
         var _loc1_:int = petModel.crtPetInfo.star;
         if(!starUpEff)
         {
            starUpEff = new BmcSpriteSheet();
            starUpEff.init(10170001,1,"all",false,1,0,null,true);
            this.addChild(starUpEff);
         }
         else
         {
            starUpEff.init(10170001,1,"all",false,1,0,null,true);
         }
         if(_loc1_ <= 10)
         {
            starUpEff.x = this.list_stars.x + 38 * (_loc1_ - 1) - 70 - 22;
            starUpEff.y = this.list_stars.y - 72;
         }
         else
         {
            starUpEff.x = this.list_stars2.x + 38 * (_loc1_ - 10 - 1) - 70 - 22;
            starUpEff.y = this.list_stars2.y - 72;
         }
         TweenLite.delayedCall(0.6,update);
         TweenLite.delayedCall(0.5,showLvlUpTip);
      }
      
      private function onLoaded(param1:SpecterEffect) : void
      {
         param1.y = param1.y - 125;
         param1.x = param1.x + 42;
      }
      
      private function showLvlUpTip() : void
      {
         var _loc2_:String = WealthUtil.getNpcName(petModel.crtPetId);
         var _loc1_:String = LocaleMgr.ins.getStr(30609010,[_loc2_,petModel.crtPetInfo.star]);
         AlertUtil.float(_loc1_,DisplayUtils.globarCenter(this).add(new Point(20,-50)),-1,null,null,1);
         needShowPropTip = true;
         ObserverMgr.ins.sendNotice("set_pet_list_enable",true);
         ObserverMgr.ins.sendNotice("pet_activate");
         eff = EffectManager.createEffect(Effect3DUtils.getUrlBySid(700130),true,null,onLoaded);
         eff.scaleAll = 5;
         petModel.panel3D.addChild3D(eff);
      }
      
      private function showTujianPanel() : void
      {
         if(_tujianPanel)
         {
            this.disposeTujianPanel();
         }
         else
         {
            _tujianPanel = new nslm2.modules.cultivates.pet.view.panel.PetStarPreViewPanel();
            _tujianPanel.x = 435;
            _tujianPanel.y = 82;
            _tujianPanel.updateInfo(petModel.crtPetId);
            parent.parent.addChild(_tujianPanel);
            _tujianPanel.addEventListener("close",disposeTujianPanel);
            _tujianPanel.panelFadeIn();
         }
      }
      
      protected function disposeTujianPanel(param1:Event = null) : void
      {
         if(_tujianPanel)
         {
            _tujianPanel.removeEventListener("close",disposeTujianPanel);
            _tujianPanel.panelFadeOutAndDispose();
            _tujianPanel = null;
         }
      }
      
      override public function dispose() : void
      {
         clear();
         super.dispose();
      }
      
      private function clear() : void
      {
         TweenLite.killDelayedCallsTo(update);
         TweenLite.killDelayedCallsTo(showLvlUpTip);
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
