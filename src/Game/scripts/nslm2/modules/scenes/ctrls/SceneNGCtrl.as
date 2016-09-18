package nslm2.modules.scenes.ctrls
{
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.scenes.commons.SceneNpc3D;
   import com.greensock.TweenLite;
   import org.specter3d.display.particle.SpecterEffect;
   import org.specter3d.loaders.AssetLib;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcSpecialEffectVo;
   import org.specter3d.display.particle.EffectManager;
   import org.specter3d.context.AppGlobalContext;
   import org.specter3d.loaders.ResourceVo;
   import flash.geom.Point;
   import com.mz.core.utils.MathUtil;
   import nslm2.utils.TransformUtil;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import com.mz.core.logging.Log;
   import flash.geom.Vector3D;
   
   public class SceneNGCtrl extends SceneCtrlBase implements IObserver
   {
       
      
      private var _ngNpc:SceneNpc3D;
      
      protected var moveArrow:SpecterEffect;
      
      public function SceneNGCtrl()
      {
         super();
      }
      
      override public function init(param1:Scene45Base) : void
      {
         super.init(param1);
         ObserverMgr.ins.regObserver(this);
      }
      
      public function get ngNpc() : SceneNpc3D
      {
         return _ngNpc;
      }
      
      public function set ngNpc(param1:SceneNpc3D) : void
      {
         if(_ngNpc != param1)
         {
            _ngNpc = param1;
            if(_ngNpc)
            {
               this.scene.hideOtherNpcAndPlayers(ngNpc);
               initNgMoveArrow();
               this.validateLookAtPoi();
            }
            else
            {
               this.scene.hideOtherNpcAndPlayers(null);
               TweenLite.killDelayedCallsTo(this.validateMoveArrowPos);
               if(moveArrow)
               {
                  moveArrow.dispose();
                  moveArrow = null;
               }
            }
         }
      }
      
      protected function initNgMoveArrow() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(ngNpc == null)
         {
            return;
         }
         if(AssetLib.hasAsset(UrlLib.ng_role_move_arrow()))
         {
            _loc1_ = StcMgr.ins.getSpecialEffectVo(600001);
            _loc2_ = UrlLib.e3d_particle(_loc1_.effect);
            moveArrow = EffectManager.createEffect(_loc2_,false,null);
            scene.avatarLayer.addChild(moveArrow);
            validateMoveArrowPos();
         }
         else
         {
            AppGlobalContext.asynLoader.loadOne(new ResourceVo(UrlLib.ng_role_move_arrow()),initNgMoveArrow);
         }
      }
      
      protected function validateMoveArrowPos() : void
      {
         var _loc1_:* = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(moveArrow)
         {
            _loc1_ = scene.playerHero.pos2d;
            _loc3_ = MathUtil.disWith2Point(_loc1_,this.ngNpc.pos2d);
            if(_loc3_ < 160)
            {
               this.moveArrow.visible = false;
            }
            else
            {
               this.moveArrow.visible = true;
               _loc2_ = MathUtil.roWith2Point(_loc1_,this.ngNpc.pos2d);
               this.moveArrow.position = TransformUtil.tran2DTo3D(_loc1_.x,_loc1_.y);
               this.moveArrow.rotationY = _loc2_ + 90;
            }
            TweenLite.killDelayedCallsTo(this.validateMoveArrowPos);
            TweenLite.delayedCall(0.3,this.validateMoveArrowPos);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_player_hero_CHANGE_POS","scene_run_to_npc","msg_ng_move_to_npc"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc7_:* = param1;
         if("msg_player_hero_CHANGE_POS" !== _loc7_)
         {
            if("scene_run_to_npc" !== _loc7_)
            {
               if("msg_ng_move_to_npc" === _loc7_)
               {
                  ngNpc = null;
                  _loc3_ = param2;
                  _loc4_ = this.scene.npcArr.length;
                  _loc6_ = 0;
                  while(_loc6_ < _loc4_)
                  {
                     _loc5_ = this.scene.npcArr[_loc6_];
                     if(_loc5_.npcGroupId == int(param2))
                     {
                        ngNpc = _loc5_;
                        break;
                     }
                     _loc6_++;
                  }
                  if(ngNpc == null)
                  {
                     Log.fatal(this,"没找到NG需要的npc","npcGroupId",int(param2));
                  }
                  else
                  {
                     this.scene.playerHero.ngNpc = ngNpc;
                  }
               }
            }
            else if(ngNpc == param2)
            {
               ngNpc = null;
               NGUtil.findNgCpl();
            }
         }
         else if(ngNpc)
         {
            validateMoveArrowPos();
         }
      }
      
      public function validateLookAtPoi() : void
      {
         var _loc1_:* = null;
         if(ngNpc)
         {
            _loc1_ = TransformUtil.stage3Dto2D(ngNpc.position,this.scene);
            NGUtil.setArrowPos(new Point(_loc1_.x - 40,_loc1_.y - 180),new Point(80,180));
         }
      }
      
      public function changeArrowPos() : void
      {
         var _loc1_:* = null;
         if(ngNpc)
         {
            _loc1_ = TransformUtil.stage3Dto2D(ngNpc.position,this.scene);
            NGUtil.changeArrowPos(new Point(_loc1_.x - 40,_loc1_.y - 180),new Point(80,180));
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         TweenLite.killDelayedCallsTo(this.validateMoveArrowPos);
         TweenLite.killDelayedCallsTo(this.validateLookAtPoi);
         if(moveArrow)
         {
            moveArrow.dispose();
            moveArrow = null;
         }
         super.dispose();
      }
   }
}
