package nslm2.modules.funnies.teamPKCS.invite
{
   import flash.display.Sprite;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.ui.components.comp3ds.TileImg;
   import nslm2.utils.TransformUtil;
   import game.ui.teamPKCS.invite.TPKIPosUI;
   import flash.geom.Point;
   import com.netease.protobuf.UInt64;
   import nslm2.utils.Uint64Util;
   import proto.TeamMemberState;
   import nslm2.common.scene.multiLayer.configs.BgTileImgConfigVo;
   import com.mz.core.configs.ClientConfig;
   import com.mz.core.mgrs.UIMgr;
   
   public class TPKCInviteScene3D extends Sprite
   {
       
      
      public var layer3D:ObjectContainer3D;
      
      public var sceneLayer3D:ObjectContainer3D;
      
      public var bgBack:TileImg;
      
      public var avatars:Vector.<nslm2.modules.funnies.teamPKCS.invite.TPKCInviteUnit3D>;
      
      public var del_btns:Array;
      
      private var pos_ui:TPKIPosUI;
      
      public function TPKCInviteScene3D()
      {
         super();
         layer3D = new ObjectContainer3D();
         sceneLayer3D = new ObjectContainer3D();
         UIMgr.root3D.addChild(layer3D);
         layer3D.addChild(sceneLayer3D);
      }
      
      public function init() : void
      {
         TransformUtil.cameraToScene45();
         createBg(36000);
         initAvatar();
      }
      
      public function initAvatar() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         if(!avatars)
         {
            avatars = new Vector.<nslm2.modules.funnies.teamPKCS.invite.TPKCInviteUnit3D>();
         }
         if(!pos_ui)
         {
            pos_ui = new TPKIPosUI();
         }
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            _loc1_ = new nslm2.modules.funnies.teamPKCS.invite.TPKCInviteUnit3D(layer3D);
            layer3D.addChild(_loc1_);
            _loc1_.pos2d = new Point(pos_ui["s" + _loc2_].x,-pos_ui["s" + _loc2_].y);
            _loc1_.rotationY = 35;
            avatars.push(_loc1_);
            _loc2_++;
         }
      }
      
      public function setSignUpTeam(param1:Array) : void
      {
         var _loc2_:int = 0;
         if(param1 == null)
         {
            _loc2_ = 0;
            while(_loc2_ < 5)
            {
               this.avatars[_loc2_].visible = false;
               this.avatars[_loc2_].showReadyIcon(false);
               if(del_btns && _loc2_ > 0)
               {
                  del_btns[_loc2_].visible = false;
               }
               _loc2_++;
            }
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            this.avatars[_loc2_].initSignUpPlayer(param1[_loc2_]);
            this.avatars[_loc2_].visible = true;
            this.avatars[_loc2_].showReadyIcon(false);
            _loc2_++;
         }
      }
      
      public function setTeam(param1:Array) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            this.avatars[_loc2_].visible = false;
            this.avatars[_loc2_].showReadyIcon(false);
            if(del_btns && _loc2_ > 0)
            {
               del_btns[_loc2_].visible = false;
            }
            _loc2_++;
         }
         if(param1 == null)
         {
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            this.avatars[_loc2_].initByArenaPlayer(param1[_loc2_]);
            this.avatars[_loc2_].visible = true;
            if(del_btns && _loc2_ > 0)
            {
               del_btns[_loc2_].visible = true;
            }
            _loc2_++;
         }
      }
      
      public function setOneReady(param1:UInt64, param2:Boolean) : void
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 5)
         {
            if(this.avatars[_loc3_].visible && Uint64Util.equal(this.avatars[_loc3_].arenaPlayer.mem.player.id,param1))
            {
               this.avatars[_loc3_].showReadyIcon(param2);
               break;
            }
            _loc3_++;
         }
      }
      
      public function addOne(param1:TeamMemberState) : void
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < 5)
         {
            if(this.avatars[_loc2_].visible == false)
            {
               this.avatars[_loc2_].visible = true;
               this.avatars[_loc2_].showReadyIcon(false);
               this.avatars[_loc2_].initByArenaPlayer(param1);
               if(del_btns && _loc2_ > 0)
               {
                  del_btns[_loc2_].visible = true;
               }
               break;
            }
            _loc2_++;
         }
      }
      
      private function createBg(param1:int) : void
      {
         var _loc2_:BgTileImgConfigVo = new BgTileImgConfigVo();
         _loc2_.needLoadConfigXML = true;
         _loc2_.mapId = param1;
         _loc2_.id = 102;
         bgBack = new TileImg(_loc2_);
         bgBack.z = 500;
         bgBack.rotationX = TransformUtil.scene45roX;
         bgBack.x = -ClientConfig.SCENE_BG_W >> 1;
         bgBack.y = 280;
         sceneLayer3D.addChild(bgBack);
         bgBack.loadTileAll();
      }
      
      public function dispose() : void
      {
         if(bgBack)
         {
            bgBack.dispose();
         }
         var _loc3_:int = 0;
         var _loc2_:* = avatars;
         for each(var _loc1_ in avatars)
         {
            _loc1_.dispose();
         }
         sceneLayer3D.dispose();
         layer3D.dispose();
      }
   }
}
