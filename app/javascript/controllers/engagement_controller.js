import ApplicationController from './application_controller'
import StimulusReflex from 'stimulus_reflex';
/* This is the custom StimulusReflex controller for EngagementReflex.
 * Learn more at: https://docs.stimulusreflex.com
 */
//import * as Choices from 'choices.js'
import { Controller } from "stimulus";
export default class extends ApplicationController {
    connect(){
        console.log("Hello, Stimulus!");
        //StimulusReflex.register(this);
        //this.element[this.identifier] = this
    
        //console.log(this);
    }

   /* addToList(event){
        console.log("add to list triggered");
        event.preventDefault();
        //super()
        //console.log(this.element);
        //this.stimulate("EngagementReflex#update_structure");
        
    }
    increment(event) {
        event.preventDefault()
        this.stimulate('EngagementReflex#increment', 1)
    }*/
  /* Reflex specific lifecycle methods.
   * Use methods similar to this example to handle lifecycle concerns for a specific Reflex method.
   * Using the lifecycle is optional, so feel free to delete these stubs if you don't need them.
   *
   * Example:
   *
   *   <a href="#" data-reflex="EngagementReflex#example">Example</a>
   *
   * Arguments:
   *
   *   element - the element that triggered the reflex
   *             may be different than the Stimulus controller's this.element
   *
   *   reflex - the name of the reflex e.g. "EngagementReflex#example"
   *
   *   error - error message from the server
   */

  // beforeUpdate(element, reflex) {
  //  element.innerText = 'Updating...'
  // }

  //updateSuccess(element, reflex) {
  //   element.innerText = 'Updated Successfully.'
  // }

   updateError(element, reflex, error) {
     console.error('updateError', error);
    //element.innerText = 'Update Failed!'
   }

}
