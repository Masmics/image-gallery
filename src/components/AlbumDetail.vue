<template>
    <section v-if="album">
        <h2>{{album.title}}</h2>
        <h3>Images</h3>
        <p class="button">
            <button @click="showModal = true">Add a new Image</button>
        </p>
        <div v-if="showModal" class="modal">
            <div class="content">
                <form @submit.prevent="handleAdd">
                    <label>
                        Title:
                        <input v-model="image.title" required>
                    </label>
                    <label>
                        Image Url:
                        <input v-model="image.url" required>
                    </label>
                    <button type="submit">Add</button>
                </form>
            <button @click="onCancel">Close</button>
            </div>
        </div>
        <nav>
            <RouterLink to="./thumbnail">Thumbnail</RouterLink>
            <RouterLink to="./list">List</RouterLink>
            <RouterLink to="./gallery">Gallery</RouterLink>
        </nav>

    <RouterView :images="album.images">DEFAULT VIEW</RouterView>
    </section>
</template>

<script>
import albumApi from '../services/albumsApi.js';
export default {
    data() {
        return {
            album: null,
            showModal: false,
            image: {}
        };
    },
    components: {},
    created() {
        this.album = albumApi.getAlbum(this.$route.params.id);
    },
    methods: {
        handleAdd() {
            albumApi.addImage(this.album, this.image);
            this.onCancel();
        },
        onCancel() {
            this.image = {};
            this.showModal = false;
        }
    }
    
};
</script>

<style>
.modal {
  position: fixed;
  top: 0; left: 0;
  height: 100%;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, .5);
}
.content {
  background: white;
  padding: 40px;
}
h2, h3 {
    text-align: center;
}
.button { 
    display: flex;
    justify-content: center;
    align-items: center;

}
</style>
