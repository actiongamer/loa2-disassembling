package nslm2.modules.footstones.textLinks.handlers
{
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class StcHorseLinkHandler extends LinkHandlerBase
   {
       
      
      private var _stcHorseId:int;
      
      public function StcHorseLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ObserverMgr.ins.sendNotice("msg_tooltip_click",StcMgr.ins.getSaddlehorseVo(stcHorseId));
      }
      
      public function get stcHorseId() : int
      {
         if(_stcHorseId == 0)
         {
            _stcHorseId = int(this.evtContent[0]);
         }
         return _stcHorseId;
      }
   }
}
