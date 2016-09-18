package nslm2.modules.dungeons.scripts.cmds
{
   import nslm2.modules.dungeons.FilmSubtitle;
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   
   public class ScriptCmd_FilmSubtitle extends ScriptCmdBase
   {
       
      
      private var ui:FilmSubtitle;
      
      public function ScriptCmd_FilmSubtitle()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         super.onStart(param1);
         ui = new FilmSubtitle();
         module.topLayer2D.addChild(ui);
         if(this.vo.fade == 0)
         {
            this.vo.fade = 600;
         }
         if(this.vo.time == 0)
         {
            this.vo.time = 1000;
         }
         ui.setTF(vo.fontColor,vo.fontSize,vo.fontBold);
         ui.show(this.vo.talk,onEnd,this.vo.fade,this.vo.time);
      }
      
      override public function onEnd() : void
      {
         if(ui)
         {
            ui.dispose();
            ui = null;
         }
         super.onEnd();
      }
   }
}
