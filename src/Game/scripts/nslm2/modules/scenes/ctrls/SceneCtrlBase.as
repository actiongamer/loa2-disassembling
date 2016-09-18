package nslm2.modules.scenes.ctrls
{
   import com.mz.core.interFace.IDispose;
   import nslm2.modules.scenes.mainCitys.Scene45Base;
   import nslm2.mgrs.stcMgrs.vos.StcStageNpcRelationVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class SceneCtrlBase implements IDispose
   {
       
      
      private var _isActived:Boolean = true;
      
      public var scene:Scene45Base;
      
      public var npcRelationId:int;
      
      public var isDisposed:Boolean = false;
      
      public function SceneCtrlBase()
      {
         super();
      }
      
      public function get isActived() : Boolean
      {
         return _isActived;
      }
      
      public function set isActived(param1:Boolean) : void
      {
         _isActived = param1;
      }
      
      public function init(param1:Scene45Base) : void
      {
         this.scene = param1;
      }
      
      public function get npcRelationVo() : StcStageNpcRelationVo
      {
         return StcMgr.ins.getStageNpcRelationVo(this.npcRelationId);
      }
      
      public function triggerAutoTrack() : void
      {
      }
      
      public function triggerLottery() : void
      {
      }
      
      public function dispose() : void
      {
         this.isDisposed = true;
         this.scene = null;
      }
   }
}
