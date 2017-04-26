EXPLORER MODE
- Non-logged-in users are greeted with a marketing page at the root describing the application.
- They have buttons to sign up or sign in.
- Users get a welcome email on sign up.
- A logged in user sees a list of their galleries at the root and a button to create a new gallery
- Each gallery displays the most-recently-added photo as a thumbnail, its title, its created_at (nicely formatted), a button to edit a gallery, a button to delete a gallery (which should also delete all that gallery's photos) and a button to go to a form to add more photos.
- Only the user who created the gallery can edit or add photos to a gallery
- Clicking the title should open (in a new tab or window) a publicly accessible page that shows the gallery and all of its photos in some thumbnail and grid form.
- Galleries are shareable via email
- Clicking on a photo in this interface should open a page such as /galleries/:gallery_id/photos/:id
- This view should show the photo larger, along with any caption the photo might have and a button to share the photo via email
- Users can log out.

ADVENTURE MODE
- On the photo adding form, they have the option to check a box that if checked will kick them back to an empty form after they submit (so they can add one photo after another)
- Photos can be removed from a gallery.
- when viewing a photo in a gallery, there are buttons/links to the previous and next photos in the gallery

LEGENDARY MODE
- Photos in a gallery can be sorted.
- Photos can appear in multiple galleries without needing be uploaded multiple times.
- Instead of a separate page, clicking on a photo in the public gallery view should open a modal window with the larger photo and the caption
- Non-logged-in users can submit photos to gallery, but these photos must be approved by the gallery owner before they appear in the gallery.
