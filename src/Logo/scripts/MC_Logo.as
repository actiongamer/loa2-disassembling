package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   public dynamic class MC_Logo extends MovieClip
   {
       
      
      public function MC_Logo()
      {
         super();
         addFrameScript(59,this.frame60);
      }
      
      function frame60() : *
      {
         stop();
         this.dispatchEvent(new Event("movie_stop_event"));
      }
   }
}
