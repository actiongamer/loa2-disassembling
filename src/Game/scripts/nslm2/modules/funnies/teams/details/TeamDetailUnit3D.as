package nslm2.modules.funnies.teams.details
{
   import nslm2.modules.scenes.commons.UIUnit3D;
   import proto.TeamMemberState;
   import com.game.shared.component.NameTag3D;
   import away3d.entities.Entity;
   import morn.core.components.Label;
   import flash.display.BitmapData;
   import morn.core.utils.BitmapUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.Uint64Util;
   import nslm2.modules.funnies.teamGuajiScenes.TeamGuajiService;
   import nslm2.mgrs.skins.ColorLib;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import away3d.containers.ObjectContainer3D;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class TeamDetailUnit3D extends UIUnit3D
   {
       
      
      private var _vo:TeamMemberState;
      
      public var _nameTag:NameTag3D;
      
      public var _fightTag3D:NameTag3D;
      
      public function TeamDetailUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.needShowTreasure = true;
         this.box3D2.scaleAll = DefindConsts.SCENE_AVATAR_SCALE_UI / DefindConsts.SCENE_AVATAR_SCALE_SCENE * 0.8;
      }
      
      public function get vo() : TeamMemberState
      {
         return _vo;
      }
      
      public function showName(param1:String, param2:uint) : void
      {
         if(_nameTag == null)
         {
            _nameTag = new NameTag3D();
            tag3DVBox.addChild(_nameTag);
            _nameTag.renderLayer = Entity.TOP_LAYER;
            _nameTag.y = 7;
         }
         var _loc3_:Label = new Label();
         _loc3_.color = param2;
         _loc3_.text = param1;
         _loc3_.commitMeasure();
         var _loc4_:BitmapData = new BitmapData(_loc3_.width,_loc3_.height,true,0);
         _loc4_.draw(_loc3_,null,null,null,null,true);
         _loc4_ = BitmapUtils.transparentCut(_loc4_);
         _nameTag.setBitmapData(_loc4_,true);
      }
      
      public function showFightValue(param1:Number) : void
      {
         if(_fightTag3D == null)
         {
            _fightTag3D = new NameTag3D();
            tag3DVBox.addChild(_fightTag3D);
            _fightTag3D.renderLayer = Entity.TOP_LAYER;
            _fightTag3D.y = -7;
         }
         var _loc2_:Label = new Label();
         _loc2_.text = LocaleMgr.ins.getStr(999000473) + String(param1);
         _loc2_.commitMeasure();
         _loc2_.style = "下划线黄色";
         var _loc3_:BitmapData = new BitmapData(_loc2_.width,_loc2_.height,true,0);
         _loc3_.draw(_loc2_,null,null,null,null,true);
         _loc3_ = BitmapUtils.transparentCut(_loc3_);
         _fightTag3D.setBitmapData(_loc3_,true);
      }
      
      public function set vo(param1:TeamMemberState) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = false;
         var _loc2_:* = null;
         _vo = param1;
         if(_vo)
         {
            PlayerModel.ins.changePlayerViewByPlayerBaseInfo(this,_vo.mem.player);
            _loc3_ = "";
            if(Uint64Util.equal(_vo.mem.player.id,TeamGuajiService.ins.curPlayerTeamInfo.leader))
            {
               _loc3_ = LocaleMgr.ins.getStr(41210087);
            }
            _loc4_ = PlayerModel.ins.dist == _vo.mem.player.dist;
            this.showName(PlayerModel.ins.getFullNameWithDistName(vo.mem.player,false,false) + _loc3_,ColorLib.qualityColor(MilitaryModel.ins.getPlayerQuality(_vo.mem.player.militaryRank)));
            if(vo.mem.player.familyName)
            {
               this.tag3DVBox.showGuildName(vo.mem.player.familyName);
            }
            this.showFightValue(Uint64Util.toNumber(_vo.mem.player.ability));
         }
         this.rotation = -90;
      }
   }
}
