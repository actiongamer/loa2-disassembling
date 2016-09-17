package nslm2.modules.scenes.commons
{
   import com.mz.core.interFace.IObserver;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DMouseRandomActionCtrl;
   import flash.geom.Point;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.common.model.HeroModel;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.cultivates.skin.SkinModel;
   import com.mz.core.mgrs.ObserverMgr;
   import away3d.containers.ObjectContainer3D;
   import nslm2.common.ui.components.comp3ds.ctrls.Avatar3DDragCtrl;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   
   public class UIUnit3D extends Unit3DBase implements IObserver
   {
       
      
      public var avatarRandomActionCtrl:Avatar3DMouseRandomActionCtrl;
      
      public function UIUnit3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.overMethodEnabled = false;
         this.inUI = true;
         this.useBigTex = true;
         this.buttonMode = true;
         this.parts.push(new Avatar3DDragCtrl(this));
         avatarRandomActionCtrl = new Avatar3DMouseRandomActionCtrl(this);
         this.parts.push(new Avatar3DMouseRandomActionCtrl(this));
         this.box3D2.scaleAll = DefindConsts.SCENE_AVATAR_SCALE_UI / DefindConsts.SCENE_AVATAR_SCALE_SCENE;
         ObserverMgr.ins.regObserver(this);
      }
      
      public function moveToAndFaceFoward(param1:Point) : void
      {
         if(!param1.equals(this.pos2d))
         {
            this.runTo(param1.x,param1.y,moveToRunHandler);
         }
      }
      
      private function moveToRunHandler() : void
      {
         this.setRotation(-90,true);
      }
      
      public function getFocusNotices() : Array
      {
         return ["evtFashionUsingChange"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = null;
         if(isDispose)
         {
            return;
         }
         var _loc4_:* = param1;
         if("evtFashionUsingChange" === _loc4_)
         {
            if(stcNpcId)
            {
               _loc3_ = StcMgr.ins.getNpcVo(stcNpcId);
               if(HeroModel.ins.isCurPlayerHeroByStcNpcId(_loc3_.node))
               {
                  PlayerModel.ins.changePlayerViewByPlayerInfo(this,PlayerModel.ins.playerInfo);
               }
               else
               {
                  PlayerModel.ins.changePlayerView(this,stcNpcId,SkinModel.ins.getEquppiedSkinIdByNpcId(stcNpcId),0);
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
