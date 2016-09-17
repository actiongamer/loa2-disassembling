package nslm2.modules.battles.PeakSports.scene
{
   import nslm2.common.model.PlayerModel;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.geom.PoiAndRoVo;
   import nslm2.utils.Uint64Util;
   import away3d.containers.ObjectContainer3D;
   
   public class PeakSportsEnemy3D extends PeakSportsBase3D
   {
       
      
      public function PeakSportsEnemy3D(param1:ObjectContainer3D = null)
      {
         super(param1);
      }
      
      override public function initName() : void
      {
         this.tag3DVBox.initName(PlayerModel.ins.getPlayerNameWithAccType(PlayerModel.ins.getFullNameWithDistName(this.playerInfo.baseInfo,false),this.playerInfo.baseInfo.gmType,0),side == 1?4827135:458496);
      }
      
      override protected function validatePos() : void
      {
         ObserverMgr.ins.sendNotice("msg_other_player_change_pos",new PoiAndRoVo(pos2d,this.rotation,Uint64Util.toString(this.playerInfo.baseInfo.id)));
         super.validatePos();
      }
   }
}
