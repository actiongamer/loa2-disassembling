package nslm2.modules.battles.guildDungeons.render
{
   import game.ui.guildDungeon.render.GuildDungeonFlagRenderUI;
   import nslm2.modules.scenes.commons.UIUnit3DS2;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.mgrs.stcMgrs.vos.StcFamilyStageNodeVo;
   import nslm2.mgrs.MouseIconManager;
   import away3d.materials.methods.ColorTransformMethod;
   import morn.customs.FilterLib;
   import flash.geom.ColorTransform;
   import proto.FamilyStageFightStartNotify;
   import nslm2.modules.battles.guildDungeons.GuildDungeonModel;
   import proto.FamilyStageFightEndNotify;
   import nslm2.modules.footstones.localeModules.LocaleConsts;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.resourceDg.ResTalkUI;
   import nslm2.common.compsEffects.SummaryZoomInEffCtrl;
   import flash.geom.Point;
   import morn.core.utils.StringUtils;
   import nslm2.nets.sockets.ServerEngine;
   import flash.events.Event;
   import proto.FamilyStageRecordReq;
   import proto.FamilyStageRecordRes;
   import nslm2.modules.Chapters.ShowStageInfoVo;
   import com.mz.core.event.MzEvent;
   import com.mz.core.mediators.RollMediator;
   
   public class GuildDungeonFlagRender extends GuildDungeonFlagRenderUI
   {
       
      
      public var state:int;
      
      protected var _bossAvatar:UIUnit3DS2;
      
      private var _fightingEffect:BmcSpriteSheet;
      
      private var _colorTransformMethod:ColorTransformMethod;
      
      private var _talkBox:ResTalkUI;
      
      private var _summaryZoomInCtrl:SummaryZoomInEffCtrl;
      
      public function GuildDungeonFlagRender(param1:int)
      {
         super();
         state = param1;
         this.parts.push(new RollMediator(this,onMouseOver));
         this.img_cross.visible = false;
      }
      
      protected function get vo() : StcFamilyStageNodeVo
      {
         return this.dataSource as StcFamilyStageNodeVo;
      }
      
      protected function setMouseCursorOver() : void
      {
         MouseIconManager.ins.addMouseFor3D(_bossAvatar);
         MouseIconManager.changeMouseCursor("hand");
      }
      
      protected function setMouseCursorOut() : void
      {
         MouseIconManager.reset();
         MouseIconManager.ins.hideSpecialMouseCursor();
      }
      
      private function onMouseOver(param1:Boolean) : void
      {
         if(param1)
         {
            setMouseCursorOver();
            this.filters = FilterLib.ins.getFilterArr(301);
            if(_colorTransformMethod == null)
            {
               _colorTransformMethod = new ColorTransformMethod();
               _colorTransformMethod.colorTransform = new ColorTransform(1.2,1.2,1.2,1,0,0,0,0);
            }
            if(_bossAvatar)
            {
               if(!_bossAvatar.hasMethod(_colorTransformMethod))
               {
                  _bossAvatar.addMethod(_colorTransformMethod);
               }
            }
         }
         else
         {
            setMouseCursorOut();
            if(_bossAvatar)
            {
               _bossAvatar.removeMethod(_colorTransformMethod);
            }
            this.filters = null;
         }
      }
      
      private function onFightStart(param1:FamilyStageFightStartNotify) : void
      {
         if(param1.nodeid == this.vo.id)
         {
            this.state = param1.state;
            GuildDungeonModel.ins.changeNodeState(param1.nodeid,param1.state);
            refresh();
         }
      }
      
      protected function onFightEnd(param1:FamilyStageFightEndNotify) : void
      {
         if(param1.nodeid == this.vo.id)
         {
            this.state = param1.state;
            GuildDungeonModel.ins.onNodeInfoChange(param1);
            refresh();
         }
      }
      
      protected function refresh() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:* = null;
         changeState();
         if(this.vo.kind == 1)
         {
            _loc1_ = GuildDungeonModel.ins.getNodeLeftHpPer(this.vo.id);
            this.progressBar_hp.value = _loc1_;
            this.progressBar_hp.label = LocaleConsts.percentStr(_loc1_);
            _loc2_ = StcMgr.ins.getBuffVo(GuildDungeonModel.ins.getNodeInfo(this.vo.id).buffid);
            if(_loc2_)
            {
               this.txt_buffDes.text = LocaleMgr.ins.getStr(40710106) + LocaleMgr.ins.getStr(_loc2_.desc);
            }
            else
            {
               this.box_desc.visible = false;
            }
         }
         else
         {
            this.progressBar_hp.visible = false;
            this.box_desc.visible = false;
         }
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         this.txt_dungeonName.text = LocaleMgr.ins.getStr(this.vo.name);
         _bossAvatar = new UIUnit3DS2();
         _bossAvatar.useBigTex = false;
         _bossAvatar.scaleAll = 0.5;
         switchEventListeners(true);
         if(state != 3)
         {
            _bossAvatar.initByStcNpcId(StcMgr.ins.getNpcGroupVo(this.vo.npcgroup).head_id);
            _bossAvatar.buttonMode = true;
            _loc2_ = this.vo.position.split(",");
            _bossAvatar.pos2d = new Point(_loc2_[0] - 505,-_loc2_[1] + 280);
            _bossAvatar.rotation = -90;
            GuildDungeonModel.ins.panel3D.addChild3D(_bossAvatar);
            if(_talkBox == null && StringUtils.isNull(this.vo.descript) == false)
            {
               _talkBox = new ResTalkUI();
               _talkBox.txt_summary.text = LocaleMgr.ins.getStr(this.vo.descript);
               _talkBox.x = 0;
               _talkBox.y = -200;
               this.addChild(_talkBox);
               _summaryZoomInCtrl = new SummaryZoomInEffCtrl(_talkBox);
               this.parts.push(new SummaryZoomInEffCtrl(_talkBox));
            }
         }
         else
         {
            if(_bossAvatar)
            {
               _bossAvatar.dispose();
               _bossAvatar = null;
            }
            if(_talkBox)
            {
               _talkBox.dispose();
               _talkBox = null;
            }
            if(_summaryZoomInCtrl)
            {
               _summaryZoomInCtrl.dispose();
               _summaryZoomInCtrl = null;
            }
         }
         refresh();
      }
      
      protected function changeState() : void
      {
         switch(int(state) - 1)
         {
            case 0:
               showCanFight();
               break;
            case 1:
               showIsFighting();
               break;
            case 2:
               showClear();
               break;
            case 3:
               showCanNotFight();
         }
      }
      
      protected function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            this.addEventListener("click",onClick);
            _bossAvatar.addEventListener("unitMouseClick",onClick);
            _bossAvatar.addEventListener("unitMouseOver",onAvatarOver);
            _bossAvatar.addEventListener("unitMouseOut",onAvatarOut);
            ServerEngine.ins.addAlwayHandler(7158,onFightStart);
            ServerEngine.ins.addAlwayHandler(7159,onFightEnd);
         }
         else
         {
            this.removeEventListener("click",onClick);
            if(_bossAvatar)
            {
               _bossAvatar.removeEventListener("unitMouseClick",onClick);
               _bossAvatar.removeEventListener("unitMouseOver",onAvatarOver);
               _bossAvatar.removeEventListener("unitMouseOut",onAvatarOut);
            }
            ServerEngine.ins.removeAlwayHandler(7158,onFightStart);
            ServerEngine.ins.removeAlwayHandler(7159,onFightEnd);
         }
      }
      
      protected function onAvatarOut(param1:Event) : void
      {
         onMouseOver(false);
      }
      
      protected function onAvatarOver(param1:Event) : void
      {
         onMouseOver(true);
      }
      
      protected function onClick(param1:Event) : void
      {
         var _loc2_:FamilyStageRecordReq = new FamilyStageRecordReq();
         _loc2_.nodeid = this.vo.id;
         ServerEngine.ins.send(7149,_loc2_,server_stageRecord_cpl);
      }
      
      private function server_stageRecord_cpl(param1:FamilyStageRecordRes) : void
      {
         GuildDungeonModel.ins.addStageBtlGuideInfo(this.vo.id,param1);
         var _loc2_:ShowStageInfoVo = new ShowStageInfoVo();
         _loc2_.point = new Point(this.x,this.y - 65 + 28);
         _loc2_.id = this.vo.id;
         this.dispatchEvent(new MzEvent("evtShowStageInfo",_loc2_,true));
      }
      
      protected function showCanFight() : void
      {
         showEffect(false);
      }
      
      protected function showClear() : void
      {
         showEffect(false);
         this.box_desc.visible = false;
         this.img_cross.visible = true;
         if(this._bossAvatar)
         {
            _bossAvatar.dispose();
            _bossAvatar = null;
         }
      }
      
      protected function showIsFighting() : void
      {
         showEffect(true);
      }
      
      protected function showCanNotFight() : void
      {
         showEffect(false);
      }
      
      protected function showEffect(param1:Boolean) : void
      {
         if(param1)
         {
            if(_fightingEffect == null)
            {
               _fightingEffect = new BmcSpriteSheet();
               _fightingEffect.init(4040008,1,"all",true);
               _fightingEffect.x = -31;
               _fightingEffect.y = -105;
            }
         }
         else if(_fightingEffect)
         {
            _fightingEffect.dispose();
            _fightingEffect = null;
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
   }
}
