package nslm2.modules.scenes.shenYuans.scenes
{
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import com.mz.core.configs.ClientConfig;
   import flash.geom.Point;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.display.particle.EffectManager;
   import nslm2.utils.Effect3DUtils;
   import com.mz.core.mgrs.UIMgr;
   import com.mz.core.utils.MathUtil;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.utils.TransformUtil;
   import morn.core.utils.NumberUtil;
   import nslm2.modules.scenes.commons.SceneModel;
   import flash.geom.Vector3D;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class ShenYuanScene extends Scene45Base
   {
      
      public static var initNPC_R:int = 868;
      
      public static var initNPC_L:int = 400;
       
      
      private var npcCtrl_R:nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl;
      
      private var npcCtrl_L:nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl;
      
      private var effWall:SpecterEffect;
      
      public var currLevelNpc:nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl;
      
      public var lv:int = 1;
      
      public function ShenYuanScene()
      {
         super();
      }
      
      override protected function init3D() : void
      {
         super.init3D();
         var _loc2_:int = ClientConfig.SCENE_FIXED_W;
         var _loc1_:int = ClientConfig.SCENE_FIXED_H;
         _lookAtPos2d = new Point(_loc2_ / 2,_loc1_ / 2);
         validateCameralookAtPos(false);
      }
      
      override protected function initCtrl() : void
      {
         super.initCtrl();
         npcCtrl_R = new nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl();
         var _loc1_:nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl = new nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl();
         _loc1_.npcRelationId = 199;
         this.ctrlArr.push(_loc1_);
         npcCtrl_L = new nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl();
         _loc1_ = new nslm2.modules.scenes.shenYuans.scenes.ShenYuanNpcCtrl();
         _loc1_.npcRelationId = 199;
         this.ctrlArr.push(_loc1_);
      }
      
      override protected function initBg() : void
      {
         super.initBg();
         this.multiBgLayer.loadTileAll();
         effWall = EffectManager.createEffect(Effect3DUtils.getUrlBySid(6200),true,null,null,0,true,1);
         this.effLayer3D.addChild(effWall);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         if(effWall)
         {
            effWall.dispose();
            effWall = null;
         }
      }
      
      override protected function showOtherRoleArr() : void
      {
         super.showOtherRoleArr();
      }
      
      override protected function onGameResize() : void
      {
      }
      
      override public function setLookAtPos2d(param1:Point, param2:Boolean) : void
      {
         if(this.isDisposed)
         {
            return;
         }
         if(this.lockCamera)
         {
            return;
         }
         var _loc5_:int = ClientConfig.SCENE_FIXED_W;
         var _loc3_:int = ClientConfig.SCENE_FIXED_H;
         var _loc6_:int = Math.max(ClientConfig.SCENE_SHAKE_GAP,_loc5_ - UIMgr.gameWidth) / 2;
         var _loc7_:int = Math.max(ClientConfig.SCENE_SHAKE_GAP,_loc3_ - UIMgr.gameHeight) / 2;
         var _loc4_:Point = param1.clone();
         _loc4_.x = MathUtil.maxMin(_loc4_.x,_loc5_ / 2 + _loc6_,_loc5_ / 2 - _loc6_);
         _loc4_.y = param1.y - 200;
         _lookAtPos2d = _loc4_;
         validateCameralookAtPos(param2);
         ObserverMgr.ins.sendNotice("msg_scene_camera_change",_lookAtPos2d);
      }
      
      public function showLv(param1:int, param2:Boolean = true) : void
      {
         var _loc4_:* = null;
         TransformUtil.cameraToScene45();
         this.lv = param1;
         var _loc3_:int = ClientConfig.SCENE_FIXED_H + 40;
         if(NumberUtil.isOdd(param1))
         {
            if(param2)
            {
               this.playerHero.pos2d = new Point(1250,initNPC_R + _loc3_);
               this.playerHero.setRotation(180);
            }
            else
            {
               this.playerHero.pos2d = this.playerHero.pos2d.add(new Point(0,_loc3_));
            }
            SceneModel.ins.findPathMed.initFindPathMed([1]);
            npcCtrl_L.npc.pos2d = new Point(248,initNPC_L + _loc3_);
            npcCtrl_L.randomWalkCtrl.setOriPos(npcCtrl_L.npc.pos2d.clone());
            npcCtrl_L.changeLook(lv);
            npcCtrl_L.npc.setRotation(-45);
            currLevelNpc = npcCtrl_L;
            npcCtrl_R.npc.pos2d = new Point(1250,initNPC_R);
            npcCtrl_R.randomWalkCtrl.setOriPos(npcCtrl_R.npc.pos2d.clone());
            npcCtrl_R.changeLook(lv + 1);
            npcCtrl_R.npc.setRotation(-135);
            _loc4_ = npcCtrl_L.npc.position;
            _loc4_.z = _loc4_.z + 200;
            _loc4_.x = _loc4_.x + 250;
            effWall.position = _loc4_;
            effWall.rotationY = 65;
         }
         else
         {
            if(param2)
            {
               this.playerHero.pos2d = new Point(180,initNPC_L + _loc3_);
               this.playerHero.setRotation(0);
            }
            SceneModel.ins.findPathMed.initFindPathMed([2]);
            npcCtrl_R.npc.pos2d = new Point(1250,initNPC_R);
            npcCtrl_R.randomWalkCtrl.setOriPos(npcCtrl_R.npc.pos2d.clone());
            npcCtrl_R.changeLook(lv);
            npcCtrl_R.npc.setRotation(-135);
            currLevelNpc = npcCtrl_R;
            npcCtrl_L.npc.pos2d = new Point(248,initNPC_L);
            npcCtrl_L.randomWalkCtrl.setOriPos(npcCtrl_L.npc.pos2d.clone());
            npcCtrl_L.changeLook(lv + 1);
            npcCtrl_L.npc.setRotation(-45);
            _loc4_ = npcCtrl_R.npc.position;
            _loc4_.z = _loc4_.z + 180;
            _loc4_.x = _loc4_.x - 260;
            _loc4_.y = _loc4_.y + 10;
            effWall.position = _loc4_;
            effWall.rotationY = -65;
         }
         this.playerHero.alpha = 1;
         setLookAtPos2d(this.playerHero.pos2d.add(DefindConsts.SCENE45_CUR_OFFSET),false);
      }
      
      override public function getFocusNotices() : Array
      {
         return super.getFocusNotices().concat([]);
      }
      
      override public function handleNotices(param1:String, param2:*) : void
      {
         super.handleNotices(param1,param2);
         var _loc3_:* = param1;
         if("SHENYUAN_NPC_SELECT_BOSS" !== _loc3_)
         {
         }
      }
   }
}
