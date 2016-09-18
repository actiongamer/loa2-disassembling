package nslm2.modules.cultivates.pet.view.panel
{
   import game.ui.petModule.baseInfo.PetInfoPanelUI;
   import com.mz.core.interFace.IViewStackPage;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import proto.PetInfo;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.cultivates.pet.util.PetUtil;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.mgrs.stcMgrs.vos.StcPetStatusVo;
   import game.ui.roleInfos.NpcPropVo;
   import morn.core.components.Button;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.foundations.AlertUtil;
   import proto.ItemHechengReq;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.cultivates.pet.service.PetService;
   import morn.core.handlers.Handler;
   import proto.PetOnSceneReq;
   import proto.WearChangeNotify;
   import proto.PetSceneInfo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import morn.customs.tests.TestTimerCount;
   import morn.customs.expands.MornExpandUtil;
   
   public class PetBaseInfoPanel extends PetInfoPanelUI implements IViewStackPage, IObserver
   {
       
      
      private var box_follow_option_oriX:int;
      
      private var petModel:PetModel;
      
      private var LIST_STAR_CENTER_X:int = 324;
      
      private var lastPetOnSceneReq:PetOnSceneReq;
      
      private var lvlUpEff:BmcSpriteSheet;
      
      public function PetBaseInfoPanel()
      {
         petModel = PetModel.ins;
         super();
         this.box_follow_option_oriX = this.box_follow_option.x;
         this.txt_tip_follow.text = LocaleMgr.ins.getStr(32000075);
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHandler);
         this.txt_goto_secret.addEventListener("click",onGotoSecret);
         this.box_follow_option.x = box_follow_option_oriX + 80;
      }
      
      protected function onGotoSecret(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(50700);
      }
      
      public function viewStackIn() : void
      {
         this.visible = true;
         if(petModel.crtPetId)
         {
            update();
         }
         ObserverMgr.ins.regObserver(this);
         this.fadeIn();
      }
      
      public function viewStackOut() : void
      {
         ObserverMgr.ins.unregObserver(this);
         this.visible = false;
      }
      
      public function update() : void
      {
         var _loc12_:int = 0;
         var _loc2_:* = null;
         var _loc9_:int = 0;
         var _loc3_:* = null;
         var _loc11_:int = 0;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc13_:PetInfo = petModel.crtPetInfo;
         var _loc5_:PetInfoVo = petModel.getStaticData(petModel.crtPetId);
         var _loc14_:int = 1;
         var _loc1_:Array = [null,null,null,null,null,null];
         if(_loc13_)
         {
            if(_loc13_.star > 0)
            {
               _loc2_ = PetModel.getStarLightArray(_loc13_.star,true);
               _loc9_ = _loc2_.length;
               list_stars.dataSource = _loc2_;
               list_stars.repeatX = Math.min(10,_loc9_);
               if(_loc13_.star <= 10)
               {
                  list_stars_2.visible = false;
               }
               else
               {
                  list_stars_2.visible = true;
                  list_stars_2.dataSource = _loc2_;
                  list_stars_2.repeatX = _loc9_ - 10;
               }
               list_stars_2.x = LIST_STAR_CENTER_X + (-list_stars_2.width >> 1);
               list_stars.x = LIST_STAR_CENTER_X + (-list_stars.width >> 1);
            }
            else
            {
               list_stars_2.dataSource = [];
               list_stars.dataSource = [];
            }
            if(petModel.onBattlePetID == _loc13_.id)
            {
               btn_option.label = LocaleMgr.ins.getStr(32000017);
            }
            else
            {
               btn_option.label = LocaleMgr.ins.getStr(32000016);
            }
            box_compose.visible = false;
            refreshUI_follow();
            btn_option.visible = true;
            _loc14_ = _loc13_.grade;
            _loc12_ = Uint64Util.toInt(_loc13_.ability);
            _loc1_ = PetUtil.getPosBuffArr(_loc13_.id,_loc13_.star);
            list_baseProp.dataSource = HeroInfoUtil.toBasePropList(_loc13_.prop);
            _loc3_ = PetUtil.getPetAllAttrByInfo(_loc13_);
            if(_loc3_.length == 0)
            {
               list_allProp.dataSource = PetUtil.getPetAllAttr(_loc5_.stcVo.id,1,0);
               this.txt_grolyTitle.text = LocaleMgr.ins.getStr(32000011) + TextFieldUtil.htmlText2("(" + LocaleMgr.ins.getStr(320000201) + ")",16723968);
            }
            else
            {
               list_allProp.dataSource = _loc3_;
               this.txt_grolyTitle.text = LocaleMgr.ins.getStr(32000011);
            }
         }
         else
         {
            list_stars_2.dataSource = [];
            list_stars.dataSource = [];
            if(_loc5_)
            {
               _loc11_ = StcMgr.ins.getVoArrByColumnValue("static_pet_star","node",_loc5_.stcVo.node).length;
               list_baseProp.dataSource = _loc5_.basePropArr;
               list_allProp.dataSource = PetUtil.getPetAllAttr(_loc5_.stcVo.id,_loc11_ - 1,0);
               _loc12_ = _loc5_.stcVo.combat_power;
               _loc1_ = _loc5_.posBuffArr;
            }
            this.box_follow.visible = false;
            box_compose.visible = true;
            btn_option.visible = false;
            this.txt_grolyTitle.text = LocaleMgr.ins.getStr(32000011) + TextFieldUtil.htmlText2("(" + LocaleMgr.ins.getStr(320000200) + ")",458496);
            _loc7_ = StcMgr.ins.getItemVo(int(_loc5_.stcVo.description3));
            _loc8_ = _loc7_.extend_1;
            costRender.dataSource = WealthUtil.needVo(20,int(_loc5_.stcVo.description3),_loc8_);
         }
         var _loc10_:Array = [];
         var _loc6_:Array = StcMgr.ins.getVoArrByColumnValue("static_pet_status","node",petModel.crtPetId);
         _loc6_.sortOn("id",16);
         var _loc4_:StcPetStatusVo = _loc6_[0];
         _loc10_ = NpcPropVo.addProp(_loc10_,NpcPropVo.parseArrStr(_loc4_.add,"",null,0,true,true));
         list_skill.dataSource = PetUtil.getPetAllSkillVoArr(petModel.crtPetId,_loc14_);
         fightValueBoxRef.txt_fightValue.tweenValue = _loc12_;
         txt_legend.text = LocaleMgr.ins.getStr(_loc5_.stcVo.description1);
         txt_legend.height = txt_legend.textHeight + 20;
         updateInfoPos();
         infoPanel.scrollTo();
      }
      
      private function updateInfoPos() : void
      {
         box_down1.height = 28 + 20 * (!!list_allProp.dataSource?list_allProp.dataSource.length:0);
      }
      
      private function refreshUI_follow() : void
      {
         var _loc2_:PetInfo = petModel.crtPetInfo;
         var _loc1_:PetInfoVo = petModel.getStaticData(petModel.crtPetId);
         this.box_follow.visible = true;
         if(petModel.crtPetId == petModel.followPetId)
         {
            this.btn_follow.label = LocaleMgr.ins.getStr(32000074);
            this.btn_follow.disabled = false;
            this.txt_tip_follow.visible = false;
         }
         else
         {
            this.btn_follow.label = LocaleMgr.ins.getStr(32000072);
            this.btn_follow.disabled = false;
            this.txt_tip_follow.visible = false;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["update_pet_info","change_selected_pet","msg_item_num_change"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = param1;
         if("update_pet_info" !== _loc6_)
         {
            if("change_selected_pet" !== _loc6_)
            {
               if("msg_item_num_change" === _loc6_)
               {
                  if(!petModel.crtPetInfo)
                  {
                     _loc3_ = petModel.getStaticData(petModel.crtPetId);
                     _loc4_ = StcMgr.ins.getItemVo(int(_loc3_.stcVo.description3));
                     _loc5_ = _loc4_.extend_1;
                     costRender.dataSource = WealthUtil.needVo(20,int(_loc3_.stcVo.description3),_loc5_);
                  }
               }
            }
            else
            {
               update();
            }
         }
         else
         {
            update();
         }
      }
      
      private function btnClickHandler(param1:Button) : void
      {
         var _loc4_:* = null;
         var _loc3_:* = null;
         var _loc2_:int = 0;
         var _loc5_:* = param1;
         if(btn_compose !== _loc5_)
         {
            if(btn_follow !== _loc5_)
            {
               if(btn_option === _loc5_)
               {
                  if(petModel.crtPetInfo && petModel.crtPetInfo.position > 0 && petModel.crtPetInfo.position < 7)
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(32000090));
                  }
                  else
                  {
                     _loc2_ = petModel.onBattlePetID == petModel.crtPetId?2:1;
                     PetService.ins.petOnBattle(petModel.crtPetId,_loc2_,new Handler(changeOnBattleSuccess,[_loc2_]));
                  }
               }
            }
            else
            {
               server_petOnScene();
            }
         }
         else
         {
            _loc4_ = costRender.dataSource as WealthVo;
            if(PlayerModel.ins.getCountByWealthVo(_loc4_) < _loc4_.count)
            {
               AlertUtil.lackItem(_loc4_);
               return;
            }
            _loc3_ = new ItemHechengReq();
            _loc3_.itemId = BagModel.ins.getIdBySid(_loc4_.sid);
            _loc3_.count = 1;
            ServerEngine.ins.send(8102,_loc3_,composeSuccessHandler);
         }
      }
      
      public function server_petOnScene() : void
      {
         var _loc1_:PetOnSceneReq = new PetOnSceneReq();
         _loc1_.id = petModel.crtPetId;
         if(petModel.followPetId != petModel.crtPetId)
         {
            _loc1_.kind = 1;
         }
         else
         {
            _loc1_.kind = 2;
         }
         lastPetOnSceneReq = _loc1_;
         ServerEngine.ins.send(5372,_loc1_,server_onScene_cpl);
      }
      
      private function server_onScene_cpl() : void
      {
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:WearChangeNotify = new WearChangeNotify();
         _loc2_.kind = 21;
         _loc2_.uid = PlayerModel.ins.playerInfo.id;
         if(lastPetOnSceneReq.kind == 1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(32000073));
            _loc2_.pet = new PetSceneInfo();
            _loc3_ = petModel.crtPetInfo;
            _loc1_ = petModel.getStaticData(petModel.crtPetId);
            _loc2_.pet.id = petModel.crtPetId;
            _loc2_.pet.model = _loc3_.status;
         }
         ServerEngine.ins.cplHandlerBatch.execute(2006,[_loc2_],false);
         this.refreshUI_follow();
      }
      
      private function changeOnBattleSuccess(param1:int) : void
      {
         var _loc2_:* = null;
         if(param1 == 1)
         {
            if(petModel.onBattlePetID)
            {
               _loc2_ = petModel.getPetInfo(petModel.onBattlePetID);
            }
            if(_loc2_)
            {
               _loc2_.position = 0;
            }
            AlertUtil.float(LocaleMgr.ins.getStr(32000022));
            petModel.onBattlePetID = petModel.crtPetId;
            petModel.crtPetInfo.position = 7;
         }
         else
         {
            AlertUtil.float(LocaleMgr.ins.getStr(32000048));
            petModel.onBattlePetID = 0;
            petModel.crtPetInfo.position = 0;
         }
         petModel.sortPetList();
         update();
         PetUtil.checkPetRedPoint();
         ObserverMgr.ins.sendNotice("refresh_pet_list");
      }
      
      private function composeSuccessHandler() : void
      {
         this.mouseEvent = false;
         TestTimerCount.ins.add();
         lvlUpEff = new BmcSpriteSheet();
         lvlUpEff.setAnchor(0.5,0.5);
         lvlUpEff.set_endHandler(playUpEffCpl);
         lvlUpEff.init(30300003);
         addChild(lvlUpEff);
         lvlUpEff.x = 300;
         lvlUpEff.y = 200;
         petModel.sortPetList();
         ObserverMgr.ins.sendNotice("refresh_pet_list");
      }
      
      private function playUpEffCpl() : void
      {
         if(this.isDisposed)
         {
            return;
         }
         this.mouseEvent = true;
         ObserverMgr.ins.sendNotice("pet_activate");
         AlertUtil.float(LocaleMgr.ins.getStr(32000043));
      }
      
      override public function dispose() : void
      {
         super.dispose();
         ObserverMgr.ins.unregObserver(this);
      }
   }
}
