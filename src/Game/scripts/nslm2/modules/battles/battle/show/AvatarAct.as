package nslm2.modules.battles.battle.show
{
   import org.specter3d.display.avatar2.AvatarBody3D;
   import nslm2.modules.battles.battle.Player;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.modules.fightPlayer.FactoryUtil;
   import away3d.events.AnimatorEvent;
   
   public class AvatarAct extends ShowBase
   {
       
      
      private var _avatarBody:AvatarBody3D;
      
      public function AvatarAct()
      {
         super();
      }
      
      override public function start(param1:Player, param2:Object) : void
      {
         var _loc4_:StcNpcVo = StcMgr.ins.getNpcVo(param2.npcId);
         var _loc3_:StcModelVo = StcMgr.ins.getModelVo(int(_loc4_.model_id));
         _avatarBody = FactoryUtil.add3D(false,_loc3_,_loc4_.sex,FactoryUtil.weapon_ModelVos(param2.npcId),55,FactoryUtil.getWingModel3DVoByStcNpcId(param2.npcId));
         _avatarBody.position = param1.avatarBody.scenePosition;
         _avatarBody.rotationY = param1.avatar.rotationY;
         _avatarBody.scaleX = param1.isAttack == 1?_avatarBody.scaleX:Number(-_avatarBody.scaleX);
         gm.rootLayer.addChild(_avatarBody);
         _avatarBody.addEventListener("animator_complete",onActionComplete);
         _avatarBody.action = param2.actionName;
      }
      
      protected function onActionComplete(param1:AnimatorEvent) : void
      {
         _avatarBody.dispose();
      }
   }
}
