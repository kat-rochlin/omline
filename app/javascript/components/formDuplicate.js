const formDuplicate = () => {
  const formWhole = (count) => {
    return `<div>
              <div class="form-group string required teacher_studio_name"><label class="string required" for="teacher_studio_name">Studio name <abbr title="required">*</abbr></label><input class="form-control string required" type="text" name="experience[studio_name][${count}]" id="teacher_studio_name"></div>
            </div>
            <div>
              <div class="form-group string required teacher_location"><label class="string required" for="teacher_location">Location <abbr title="required">*</abbr></label><input class="form-control string required" type="text" name="experience[location][${count}]" id="teacher_location"></div>
            </div>
            <div>
              <div class="form-group string required teacher_description"><label class="string required" for="teacher_description">Description <abbr title="required">*</abbr></label><input class="form-control string required" type="text" name="experience[description][${count}]" id="teacher_description"></div>
            </div>
            <div>
              <div class="form-group date required teacher_start_date"><label class="date required" for="teacher_start_date">Start date <abbr title="required">*</abbr></label><div class="d-flex flex-row justify-content-between align-items-center"><input class="form-control mx-1 date required" type="date" name="experience[start_date][${count}]" id="teacher_start_date"></div></div>
            </div>
            <div>
              <div class="form-group date required teacher_end_date"><label class="date required" for="teacher_end_date">End date <abbr title="required">*</abbr></label><div class="d-flex flex-row justify-content-between align-items-center"><input class="form-control mx-1 date required" type="date" name="experience[end_date][${count}]" id="teacher_end_date"></div></div>
            </div>`
        }
  const addNewButton = document.querySelector("#add-experience")
  let total = 1
  if (addNewButton) {
    addNewButton.addEventListener('click', (e) => {
      e.preventDefault()
      const form = document.querySelector("#experience-content")
      form.insertAdjacentHTML('beforeend', formWhole(total));
      total += 1
      console.log(total)
    })
  }
}

export { formDuplicate }
