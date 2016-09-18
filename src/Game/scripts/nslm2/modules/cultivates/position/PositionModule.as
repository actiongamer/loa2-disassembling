package nslm2.modules.cultivates.position
{
   import game.ui.position.RolePositionPanelUI;
   import nslm2.modules.scenes.commons.UIUnit3D;
   import nslm2.common.ui.components.comp3ds.UIPanel3D;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.cultivates.horse.HorseService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.cultivates.horse.utils.HorseUtil;
   import nslm2.mgrs.stcMgrs.vos.StcSkillVo;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.skillChangePanels.SkillChangeCtrl;
   import nslm2.modules.dungeons.ctrls.FuncOpenAutoCtrl;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import flash.geom.Point;
   import proto.PetInfo;
   import flash.events.Event;
   import com.mz.core.event.MzEvent;
   import morn.customs.expands.MornExpandUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.Button;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.common.ui.components.comp3ds.Image3D;
   import morn.core.components.Image;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import nslm2.common.model.HeroModel;
   import proto.BuZhen;
   import com.mz.core.mgrs.UIMgr;
   import flash.events.MouseEvent;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.utils.ArrayUtil;
   import proto.BuZhenChangeReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.BuZhenInfo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   
   public class PositionModule extends RolePositionPanelUI
   {
      
      public static const DRAG_TYPE_POSITION_CELL:String = "drag_type_position_cell";
      
      public static const DRAG_TYPE_POSITION_AREA:String = "drag_type_position_area";
      
      public static const NUM_ROLE:int = 6;
      
      public static var panelInfos:Array;
       
      
      private var _avatar:UIUnit3D;
      
      private var panel3D:UIPanel3D;
      
      private var avatarArr:Vector.<nslm2.modules.cultivates.position.PostionAvatar3D>;
      
      private var dizuoArr:Vector.<Image3D>;
      
      private var dizuoIsOpen:Vector.<Boolean>;
      
      private var dizuoOver:Image3D;
      
      private var dizuoOver1:Image3D;
      
      private var lockArr:Vector.<nslm2.modules.cultivates.position.PositionLockRender>;
      
      private var overDizuo:Image3D;
      
      private var curAvatar:nslm2.modules.cultivates.position.PostionAvatar3D;
      
      private var startMouseXY:Point;
      
      private var lastDizuoHide:Image3D;
      
      public function PositionModule()
      {
         avatarArr = new Vector.<nslm2.modules.cultivates.position.PostionAvatar3D>();
         dizuoArr = new Vector.<Image3D>();
         dizuoIsOpen = new Vector.<Boolean>();
         lockArr = new Vector.<nslm2.modules.cultivates.position.PositionLockRender>();
         super();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc2_:* = null;
         this.panelBg.titleImgId = this.moduleId;
         this.panelBg.bgCustom.addChild(this.img_bg);
         panel3D = new UIPanel3D(this);
         DisplayUtils.addChildAbove(panel3D,this.img_bg);
         panel3D.initByImage(img_bg,this.panelBg);
         panel3D.visible = false;
         this.img_pos_lock.visible = false;
         this.posView.visible = false;
         this.render_skill.needShowValidBg = true;
         this.render_pet.needShowValidBg = true;
         if(HorseService.ins.activatedAuraList.length == 0)
         {
            this.render_skill.stcSkillId = 0;
            this.render_skill.toolTip = LocaleMgr.ins.getStr(30300024);
         }
         else
         {
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[HorseService.ins.curAuraId,HorseUtil.getRank(HorseService.ins.masterLevel)]);
            this.render_skill.stcSkillId = !!_loc2_?_loc2_.id:0;
         }
         this.img_pos_over.visible = false;
         this.img_posOri.visible = false;
         this.img_posPet.visible = false;
         this.clip_fightValue.value = PlayerModel.ins.totalFightValue;
         this.parts.push(new SkillChangeCtrl(this.btn_skill));
         this.list_buffs.visible = false;
         this.box_pet.visible = FuncOpenAutoCtrl.checkOpen(32000);
         var _loc3_:PetInfoVo = PetModel.ins.getStaticData(PetModel.ins.onBattlePetID);
         this.render_pet.dataSource = _loc3_;
         _avatar = new UIUnit3D();
         this._avatar.pos2d = new Point(-270,-280);
         _avatar.scaleAll = 0.8;
         this.panel3D.addChild3D(_avatar);
         changeAvatar3D(PetModel.ins.onBattlePetID);
         super.preShow(param1);
      }
      
      private function changeAvatar3D(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         if(this._avatar && param1 != 0)
         {
            _loc3_ = PetModel.ins.getPetInfo(param1);
            _loc2_ = !!_loc3_?PetModel.ins.getModelByNpcId(param1):0;
            this._avatar.initByStcNpcId(param1,false,0,_loc2_);
            this._avatar.addEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
            this._avatar.rotation = -45;
         }
      }
      
      protected function onHouseAvatarAnimAllComplete(param1:Event) : void
      {
         this._avatar.avatar.avatarMesh.forceRenderWithoutFrustum = true;
         this._avatar.avatar.needUpdateBounds = false;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         super.switchEventListeners(param1);
         if(param1)
         {
            HorseService.ins.addEventListener("evtAuraUsingChange",onSkillUsingChange);
         }
         else
         {
            HorseService.ins.removeEventListener("evtAuraUsingChange",onSkillUsingChange);
         }
      }
      
      private function onSkillUsingChange(param1:MzEvent) : void
      {
         var _loc2_:* = null;
         if(HorseService.ins.activatedAuraList.length == 0)
         {
            this.render_skill.stcSkillId = 0;
            this.render_skill.toolTip = LocaleMgr.ins.getStr(30300024);
         }
         else
         {
            _loc2_ = StcMgr.ins.getVoByMultiColumnValue("static_skill",["node_id","level"],[HorseService.ins.curAuraId,HorseUtil.getRank(HorseService.ins.masterLevel)]);
            this.render_skill.stcSkillId = !!_loc2_?_loc2_.id:0;
         }
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
         panel3D.visible = true;
         MornExpandUtil.addHandlerForBtnAll(this,btnHandler);
         initPositionAvatar();
         addPositionPlayer();
         refreshPetInfo();
         NGUtil.checkModuleShow(this.moduleId,null);
      }
      
      private function btnHandler(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_pet === _loc2_)
         {
            if(PetModel.ins.canSelectPetList().length > 0)
            {
               ModuleMgr.ins.showModule(32033,null,ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               AlertUtil.float(LocaleMgr.ins.getStr(32000027));
            }
         }
      }
      
      private function initPositionAvatar() : void
      {
         var _loc1_:* = null;
         var _loc9_:int = 0;
         var _loc8_:* = null;
         var _loc3_:int = 0;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         dizuoOver = new Image3D(null,img_pos_over.width,img_pos_over.height,1900,true,false);
         dizuoOver.showByBmd(img_pos_over.bitmapData);
         this.panel3D.addChild3D(dizuoOver);
         dizuoOver.mouseEnabled = true;
         dizuoOver.visible = false;
         dizuoOver1 = new Image3D(null,img_pos_over.width,img_pos_over.height,1900,true,false);
         dizuoOver1.showByBmd(img_pos_over.bitmapData);
         this.panel3D.addChild3D(dizuoOver1);
         dizuoOver1.mouseEnabled = true;
         dizuoOver1.visible = false;
         _loc9_ = 0;
         while(_loc9_ < 6)
         {
            _loc8_ = this["pos" + _loc9_];
            _loc3_ = DefindConsts.BUZHEN_OPEN_PARAM_LEVEL(_loc9_ + 1);
            if(PlayerModel.ins.level >= _loc3_)
            {
               this.dizuoIsOpen[_loc9_] = true;
            }
            else
            {
               this.dizuoIsOpen[_loc9_] = false;
               _loc6_ = new nslm2.modules.cultivates.position.PositionLockRender();
               _loc5_ = DisplayUtils.localToTarget(_loc8_,this);
               _loc6_.openLevel = _loc3_;
               _loc6_.x = _loc5_.x;
               _loc6_.y = _loc5_.y;
               this.addChild(_loc6_);
               lockArr.push(_loc6_);
            }
            _loc2_ = DisplayUtils.localToTarget(_loc8_,this.panel3D);
            _loc2_ = _loc2_.add(new Point(_loc8_.width / 2,_loc8_.height / 2));
            _loc7_ = panel3D.xy2Dto3D(_loc2_);
            _loc4_ = new Image3D(null,_loc8_.width,_loc8_.height,2000,true,false);
            _loc4_.scaleAll = _loc8_.scale;
            if(PlayerModel.ins.level >= _loc3_)
            {
               _loc4_.showByBmd(_loc8_.bitmapData);
            }
            else
            {
               _loc4_.showByBmd(img_pos_lock.bitmapData);
            }
            _loc4_.x = _loc7_.x;
            _loc4_.y = _loc7_.y;
            this.panel3D.addChild3D(_loc4_);
            dizuoArr.push(_loc4_);
            _loc4_.mouseEnabled = true;
            _loc1_ = new nslm2.modules.cultivates.position.PostionAvatar3D();
            _loc1_.setXY(_loc7_.x,_loc7_.y);
            _loc1_.rotationY = -90;
            _loc1_.buttonMode = true;
            _loc1_.addEventListener("unitMouseTrigger",avatar_trigger);
            _loc1_.addEventListener("unitMouseOver",avatar_over);
            _loc1_.addEventListener("unitMouseOut",avatar_out);
            avatarArr.push(_loc1_);
            this.panel3D.addChild3D(_loc1_);
            _loc9_++;
         }
         DisplayUtils.removeSelf(this.posView);
      }
      
      private function addPositionPlayer() : void
      {
         panelInfos = HeroModel.ins.getPositionList();
         var _loc3_:int = 0;
         var _loc2_:* = panelInfos;
         for each(var _loc1_ in panelInfos)
         {
            avatarArr[_loc1_.place - 1].data = _loc1_;
         }
      }
      
      private function changeDragState(param1:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc3_:int = lockArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = lockArr[_loc4_];
            _loc2_.mouseEvent = !param1;
            _loc4_++;
         }
      }
      
      private function avatar_over(param1:Event) : void
      {
         if(this.curAvatar)
         {
            return;
         }
         if(overDizuo)
         {
            overDizuo.visible = true;
            overDizuo = null;
         }
         var _loc2_:int = avatarArr.indexOf(param1.currentTarget as nslm2.modules.cultivates.position.PostionAvatar3D);
         overDizuo = this.dizuoArr[_loc2_];
         overDizuo.visible = false;
         dizuoOver1.x = overDizuo.x;
         dizuoOver1.y = overDizuo.y;
         dizuoOver1.scaleAll = overDizuo.scaleAll;
         dizuoOver1.visible = true;
      }
      
      private function avatar_out(param1:Event) : void
      {
         if(this.curAvatar)
         {
            return;
         }
         if(overDizuo)
         {
            overDizuo.visible = true;
            overDizuo = null;
            dizuoOver1.visible = false;
         }
      }
      
      private function avatar_trigger(param1:Event) : void
      {
         avatar_out(null);
         curAvatar = param1.currentTarget as nslm2.modules.cultivates.position.PostionAvatar3D;
         this.dizuoArr[this.avatarArr.indexOf(curAvatar)].alpha = 0.5;
         curAvatar.avatar.alpha = 0.7;
         curAvatar.z = -300;
         startMouseXY = new Point(panel3D.mouseX,panel3D.mouseY);
         UIMgr.stage.addEventListener("mouseMove",stageMouseMove);
         UIMgr.stage.addEventListener("mouseUp",stageMouseUp);
         changeDragState(true);
      }
      
      private function stageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(param1.buttonDown)
         {
            _loc2_ = new Point(panel3D.mouseX,panel3D.mouseY);
            curAvatar.x = curAvatar.oriPoint.x + (_loc2_.x - this.startMouseXY.x);
            curAvatar.y = curAvatar.oriPoint.y - (_loc2_.y - this.startMouseXY.y);
            if(lastDizuoHide)
            {
               lastDizuoHide.visible = true;
               lastDizuoHide = null;
            }
            if(!checkOverAvatar(new Point(curAvatar.x,curAvatar.y)))
            {
               checkOverAvatar(panel3D.xy2Dto3D(_loc2_));
            }
            this.dizuoOver.visible = lastDizuoHide != null;
         }
         else
         {
            stageMouseUp(param1);
         }
      }
      
      private function checkOverAvatar(param1:Point) : Boolean
      {
         var _loc4_:int = 0;
         var _loc2_:* = null;
         var _loc5_:* = param1;
         var _loc3_:int = this.dizuoArr.length;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.dizuoArr[_loc4_];
            if(dizuoIsOpen[_loc4_] && avatarArr[_loc4_] != this.curAvatar)
            {
               if(MathUtil.inCenter(_loc5_.x,_loc2_.x,_loc2_.width / 2) && MathUtil.inCenter(_loc5_.y,_loc2_.y,_loc2_.height / 2))
               {
                  _loc2_.visible = false;
                  lastDizuoHide = _loc2_;
                  dizuoOver.scaleAll = _loc2_.scaleAll;
                  dizuoOver.x = _loc2_.x;
                  dizuoOver.y = _loc2_.y;
                  return true;
               }
            }
            _loc4_++;
         }
         return false;
      }
      
      private function stageMouseUp(param1:MouseEvent) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         if(curAvatar)
         {
            UIMgr.stage.removeEventListener("mouseMove",stageMouseMove);
            UIMgr.stage.removeEventListener("mouseUp",stageMouseUp);
            _loc3_ = this.avatarArr.indexOf(curAvatar);
            this.dizuoArr[_loc3_].alpha = 1;
            if(dizuoOver.visible)
            {
               _loc4_ = this.dizuoArr.indexOf(lastDizuoHide);
               curAvatar.data.place = _loc4_ + 1;
               HeroModel.ins.changePositionPlace(curAvatar.data.id,_loc4_ + 1);
               curAvatar.oriPoint = new Point(lastDizuoHide.x,lastDizuoHide.y);
               curAvatar.resetPos(true);
               if(this.avatarArr[_loc4_].data)
               {
                  _loc2_ = this.dizuoArr[_loc3_];
                  this.avatarArr[_loc4_].data.place = _loc3_ + 1;
                  HeroModel.ins.changePositionPlace(this.avatarArr[_loc4_].data.id,_loc3_ + 1);
                  this.avatarArr[_loc4_].oriPoint = new Point(_loc2_.x,_loc2_.y);
                  this.avatarArr[_loc4_].resetPos(true);
               }
               ArrayUtil.swap(this.avatarArr,_loc3_,_loc4_);
               lastDizuoHide.visible = true;
               this.dizuoOver.visible = false;
               lastDizuoHide = null;
               server_onChange(_loc3_,_loc4_);
            }
            else
            {
               curAvatar.resetPos(true);
            }
            curAvatar.avatar.alpha = 1;
         }
         curAvatar = null;
         changeDragState(false);
      }
      
      protected function server_onChange(param1:int, param2:int) : void
      {
         var _loc3_:BuZhenChangeReq = new BuZhenChangeReq();
         _loc3_.kind = 3;
         _loc3_.from = param1 + 1;
         _loc3_.__to = param2 + 1;
         ServerEngine.ins.send(5020,_loc3_ as BuZhenChangeReq,server_cpl_chg);
      }
      
      private function server_cpl_chg(param1:BuZhenInfo = null) : void
      {
      }
      
      private function getBuzhen(param1:int, param2:Array) : BuZhen
      {
         var _loc5_:int = 0;
         var _loc4_:* = param2;
         for each(var _loc3_ in param2)
         {
            if(_loc3_.place == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         super.handleNotices(param1,param2);
         var _loc4_:* = param1;
         if("refresh_pet_list" !== _loc4_)
         {
            if("role_info_update_fight_value" === _loc4_)
            {
               this.clip_fightValue.tweenValue = PlayerModel.ins.totalFightValue;
            }
         }
         else
         {
            refreshPetInfo();
            _loc3_ = new BmcSpriteSheet();
            _loc3_.x = -35;
            _loc3_.y = -30;
            this.render_pet.addChild(_loc3_);
            _loc3_.init(1060);
            changeAvatar3D(PetModel.ins.onBattlePetID);
         }
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat(["refresh_pet_list","role_info_update_fight_value"]);
      }
      
      private function refreshPetInfo() : void
      {
         this.box_pet.visible = FuncOpenAutoCtrl.checkOpen(32000);
         var _loc2_:PetInfoVo = PetModel.ins.getStaticData(PetModel.ins.onBattlePetID);
         this.render_pet.dataSource = _loc2_;
         var _loc1_:Array = [];
      }
      
      override public function preClose(param1:Object = null) : void
      {
         if(_avatar)
         {
            _avatar.removeEventListener("avatar_anim_all_complete",onHouseAvatarAnimAllComplete);
         }
         UIMgr.stage.removeEventListener("mouseMove",stageMouseMove);
         UIMgr.stage.removeEventListener("mouseUp",stageMouseUp);
         this.panel3D.dispose();
         this.panel3D = null;
         super.preClose(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
